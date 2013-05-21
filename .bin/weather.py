#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
    WEATHER
    -------
    Get the weather in a given location
"""
import json
import math
import urllib.request
import sys


def main(location):
    url = 'http://api.openweathermap.org/data/2.5/weather?q='+ location
    data = urllib.request.urlopen(url).read()
    obj = json.loads(str(data, "utf8"))
    description = obj['weather'][0]['description']
    temperature = math.ceil((obj['main']['temp'] - 273.15) * 100) / 100
    print(description+ ", "+ str(temperature) +" degr.")


if __name__ == "__main__":
    main(sys.argv[1])
