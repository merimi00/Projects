import os

def main():
    i = 0
    path = "C:/Users/famer/Pictures/Wallpaper/"
    for filename in os.listdir(path):
        my_dest = "wallpaper" + str(i) + ".jpg"
        my_source = path + filename
        my_dest = path + my_dest
        os.rename(my_source, my_dest)
        i += 1

if __name__ == '__main__':
    main()