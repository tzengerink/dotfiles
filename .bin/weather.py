#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
    WEATHER
    -------
    Get the weather in a given location

    Example usage: `weather.py Amsterdam Netherlands`

    Copyright (c) 2012-2013 T. Zengerink
    Licensed under MIT License
    See: https://raw.github.com/gist/3151357/9e8e01df4ee12b1f04cd61e0ecee3ea8bd6f617b/mit-license.txt
"""
import json, math, string, subprocess, sys, urllib2


def main(city, country):
    url = ('http://api.openweathermap.org/data/2.5/weather?q='+ city +','
           + country)
    data = json.loads(urllib2.urlopen(url).read())
    description = string.lower(data['weather'][0]['description'])
    temperature = str(math.ceil((data['main']['temp'] - 273.15) * 100) / 100)
    print(description + ", "+ temperature +" deg.")


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: "+ sys.argv[0] +" [city] [country]")
        exit(1)
    main(sys.argv[1], sys.argv[2])
