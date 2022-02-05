import requests
from pprint import pprint

API_Key = 'ab739c61b2f479442fb7c5871a57353b'

city = input("Enter a city: ")

base_url = "https://api.openweathermap.org/data/2.5/weather?appid=" + API_Key + "&q="+city

weather_data = requests.get(base_url).json()

pprint(weather_data)