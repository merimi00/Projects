#problem with pip install qrcode; install pip
'''encoding'''
import qrcode

data = 'Don\'t forget to call bro'

img = qrcode.make(data)

img.save('C:/Users/famer/Pictures/Wallpaper/qrcode.png')

qr = qrcode.QRCode(version = 1, box_size = 10, border = 5)

qr.add_data(data)

qr.make(fit = True)
img = qr.make_image(fill_color = 'red', back_color = 'white')

img.save('C:/Users/famer/Pictures/Wallpaper/qrcode.png')


'''decoding'''
from pyzbar.pyzbar import decode
from PIL import Image


imag = Image.open('C:/Users/famer/Pictures/Wallpaper/qrcode.png')

result = decode(imag)
print(result)


