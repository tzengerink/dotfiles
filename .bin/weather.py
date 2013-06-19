#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
    WEATHER
    -------
    Get the weather in a given location. The script uses the API provided by
    forecast.io (http://developers.forecast.io).

    Example usage: `weather.py 52.357308 4.944693`

    Copyright (c) 2012-2013 T. Zengerink
    Licensed under MIT License
    See: https://raw.github.com/gist/3151357/9e8e01df4ee12b1f04cd61e0ecee3ea8bd6f617b/mit-license.txt
"""
import json, math, sys, time, urllib2


API_KEY = '45f08410c9003006ff4287e1b3d7f0ec'


class File:
    """Assists in handling files.
    path -- Path of the file.
    """
    def __init__(self, path):
        self.path = path

    def clear(self):
        """Clear the contents of the file."""
        open(self.path, 'w').close()

    def read(self):
        """Read the contents of the file."""
        contents = ""
        handle = open(self.path)
        while 1:
            line = handle.readline()
            if not line:
                break
            contents += line
        handle.close()
        return contents

    def write(self, txt):
        """Append text to the end of the file.
        txt -- Text to append to the file.
        """
        handle = open(self.path, 'a')
        handle.write(txt)
        handle.close()


def fahrenheit2celcius(i):
    return math.ceil((((i - 32) * 5) / 9) * 100) / 100

def get_point(data, point, timing='currently'):
    return data[timing][point]

def get_data(args):
    lat_long = '%s,%s' % (args[0], args[1])
    url = 'https://api.forecast.io/forecast/%s/%s' % (API_KEY, lat_long)
    data = json.loads(urllib2.urlopen(url).read())
    summary = get_point(data, 'summary')
    temperature = fahrenheit2celcius(get_point(data, 'temperature'))
    return '%s, %s' % (summary, str(temperature))

def main(args):
    cache = File('/tmp/weather-%s.%s' % (args[0], args[1]))
    lifetime = 600
    try:
        data = json.loads(cache.read())
        if time.time() > data['expires']:
            raise Exception('Cache expired')
    except:
        data = {"content": get_data(args),
                "expires": time.time() + lifetime}
        cache.clear()
        cache.write(json.dumps(data))
    print(data['content'])

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: %s [latitude] [longitude]" % sys.argv[0])
        exit(1)
    main(sys.argv[1:])
