from PIL import Image

W, V = 640, 512
im = Image.open('imgs/ysyx.png').convert('RGBA')
im = Image.alpha_composite(Image.new('RGBA', im.size, (255,255,255,255)), im).convert('RGB')
im = im.resize((640, 480))

lines = []
for h in range(W):
    for v in range(V):
        if v < 480:
            r, g, b = im.getpixel((h, v))
            val = ((r >> 4) << 8) | ((g >> 4) << 4 | (b >> 4))
        else:
            val = 0xfff
        lines.append(f"{val:03x}")

open('imgs/mem.hex', 'w').write("\n".join(lines) + "\n")

