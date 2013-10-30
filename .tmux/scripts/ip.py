#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
    IP
    --
    Get the perceived IP address of the computer you're using.

    Copyright (c) 2012-2013 T. Zengerink
    Licensed under MIT License
    See: https://raw.github.com/gist/3151357/9e8e01df4ee12b1f04cd61e0ecee3ea8bd6f617b/mit-license.txt
"""
import json, time, urllib2


LIFETIME=60


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


def get_ip():
    return urllib2.urlopen('http://ip.zengerink.com').read()

def main():
    cache = File('/tmp/ip-address')
    try:
        data = json.loads(cache.read())
        if time.time() > data['expires']:
            raise Exception('Cache expired')
    except:
        data = {'content': get_ip(),
                'expires': time.time() + LIFETIME}
        cache.clear()
        cache.write(json.dumps(data))
    print(data['content'])

if __name__ == '__main__':
        main()
