#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
    WEATHER
    -------
    Get the weather in a given location

    Example usage: `weather.py 52.357308 4.944693`

    Copyright (c) 2012-2013 T. Zengerink
    Licensed under MIT License
    See: https://raw.github.com/gist/3151357/9e8e01df4ee12b1f04cd61e0ecee3ea8bd6f617b/mit-license.txt
"""
import json, math, sys, time, urllib2


API_KEY = '45f08410c9003006ff4287e1b3d7f0ec'


def fahrenheit2celcius(i):
    return math.ceil((((i - 32) * 5) / 9) * 100) / 100

def get_point(data, point, timing='currently'):
    return data[timing][point]

def main(args):
    lat_long = '%s,%s' % (args[0], args[1])
    url = 'https://api.forecast.io/forecast/%s/%s' % (API_KEY, lat_long)
    data = json.loads(urllib2.urlopen(url).read())
    summary = get_point(data, 'summary')
    temperature = fahrenheit2celcius(get_point(data, 'temperature'))
    print("%s, %s" % (summary, str(temperature)))


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: "+ sys.argv[0] +" [latitude] [longitude]")
        exit(1)
    main(sys.argv[1:])
