import random

print('Welcome To Your Passmord Generator')

chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!@£$%^&*().,?0123456789'

number = input('Amount of passwords to generate: ')
number = int(number)

length = input('Input your passmord length: ')
length = int(length)

print('\nhere are your password(s): \n')

for pwd in range(number):
    passwords = ''
    for l in range(length):
        passwords += random.choice(chars)
    print(passwords)