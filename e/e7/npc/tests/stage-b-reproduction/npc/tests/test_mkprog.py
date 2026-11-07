"""独立核对编码和输入校验，不依赖 CPU RTL。"""

import importlib.util
from pathlib import Path
import struct
import subprocess
import sys
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location("mkprog", ROOT / "tools/mkprog.py")
mkprog = importlib.util.module_from_spec(spec)
spec.loader.exec_module(mkprog)


class MkprogTests(unittest.TestCase):
    def words(self, source):
        data, _ = mkprog.assemble(source)
        return list(struct.unpack("<" + "I" * (len(data) // 4), data))

    def test_lecture_six_words(self):
        source = (ROOT / "tests/programs/lecture.s").read_text()
        self.assertEqual(self.words(source), [
            0x01400513, 0x010000e7, 0x00c000e7,
            0x00c00067, 0x00a50513, 0x00008067,
        ])

    def test_all_nine_instructions(self):
        vectors = [
            ("add x3, x1, x2", 0x002081b3),
            ("addi a0, a0, -1", 0xfff50513),
            ("lui ra, 0x12345", 0x123450b7),
            ("lw x3, 8(x1)", 0x0080a183),
            ("lbu x6, 3(x1)", 0x0030c303),
            ("sw x2, 8(x1)", 0x0020a423),
            ("sb x5, 2(x1)", 0x00508123),
            ("jalr ra, zero, 16", 0x010000e7),
            ("ebreak", 0x00100073),
        ]
        for source, expected in vectors:
            with self.subTest(source=source):
                self.assertEqual(self.words(source), [expected])

    def test_signed_boundaries(self):
        self.assertEqual(self.words("addi x1,x0,-2048"), [0x80000093])
        self.assertEqual(self.words("addi x1,x0,2047"), [0x7ff00093])
        self.assertEqual(self.words("sw x2,-4(x1)"), [0xfe20ae23])
        self.assertEqual(self.words("lui x1,-1"), [0xfffff0b7])

    def test_aliases_and_comments(self):
        self.assertEqual(
            self.words("start: addi fp,zero,1 # comment\nadd a5,fp,s0 // comment"),
            self.words("addi x8,x0,1\nadd x15,x8,x8"),
        )

    def test_forward_and_backward_labels(self):
        self.assertEqual(self.words("start: j end\nj start\nend: ebreak"),
                         [0x00800067, 0x00000067, 0x00100073])

    def test_listing_and_little_endian(self):
        binary, listing = mkprog.assemble("addi a0, zero, 20\nebreak")
        self.assertEqual(binary[:4], bytes.fromhex("13 05 40 01"))
        self.assertIn("00000004  00100073  ebreak", listing)

    def test_invalid_inputs(self):
        sources = [
            "", "# empty", "add x16,x0,x0", "addi a6,x0,0",
            "addi x1,x0,2048", "addi x1,x0,-2049",
            "lui x1,0x100000", "lui x1,-524289",
            "lw x1,4", "addi x1,x0", "ebreak x0",
            "sub x1,x2,x3", "j absent", "here: ebreak\nhere: ebreak",
            "addi x1,x0,unknown", ".word 0",
        ]
        for source in sources:
            with self.subTest(source=source):
                with self.assertRaises(mkprog.AssemblyError):
                    mkprog.assemble(source)

    def test_jump_range(self):
        with self.assertRaises(mkprog.AssemblyError):
            mkprog.assemble("j end\n" + "ebreak\n" * 511 + "end: ebreak")

    def test_cli_outputs_and_error(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            source = root / "test.s"
            output = root / "output" / "test.bin"
            source.write_text("ebreak")
            command = [sys.executable, str(ROOT / "tools/mkprog.py"),
                       str(source), "-o", str(output)]
            result = subprocess.run(command, capture_output=True, text=True)
            self.assertEqual(result.returncode, 0, result.stderr)
            self.assertEqual(output.read_bytes(), bytes.fromhex("73 00 10 00"))
            self.assertTrue(output.with_suffix(".hex").exists())
            source.write_text("addi x16,x0,1")
            result = subprocess.run(command, capture_output=True, text=True)
            self.assertNotEqual(result.returncode, 0)
            self.assertIn("line 1", result.stderr)
            self.assertEqual(output.read_bytes(), bytes.fromhex("73 00 10 00"))


if __name__ == "__main__":
    unittest.main()
