from PIL import Image
lines = open('imgs/mem.hex').read().split()
im = Image.new('RGB', (640, 480)); px = im.load()
for h in range(640):
    for v in range(480):
        val = int(lines[h*512 + v], 16)
        px[h, v] = (((val>>8) & 0xf) * 17, ((val>>4) & 0xf) * 17, (val & 0xf) * 17)
im.save('imgs/check.png')
