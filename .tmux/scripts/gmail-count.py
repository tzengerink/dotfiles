#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
    GMAIL COUNT
    -----------
    Count the number of unread messages in a Gmail inbox.

    The script reads the content of the file `~/.gmail-pass` and uses that as
    the password to login.

    Copyright (c) 2012-2013 T. Zengerink
    Licensed under MIT License
    See: https://raw.github.com/gist/3151357/9e8e01df4ee12b1f04cd61e0ecee3ea8bd6f617b/mit-license.txt
"""
import json, time, urllib2

from os.path import expanduser
from xml.dom import minidom


LIFETIME=60
USERNAME='t.zengerink'


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


def get_rss(user, password):
    auth = urllib2.HTTPBasicAuthHandler()
    auth.add_password(realm='New mail feed',
                      uri='https://mail.google.com',
                      user='%s@gmail.com' % user,
                      passwd=password)
    urllib2.install_opener(urllib2.build_opener(auth))
    return urllib2.urlopen('https://mail.google.com/mail/feed/atom').read()

def get_data():
    home = expanduser('~')
    try:
        with file('%s/.gmail-pass' % home) as f:
            password = f.read()
    except:
        print('Could not read password file (%s/.gmail-pass).' % home)
        exit(1)
    count = get_full_count(get_rss(USERNAME, password))
    return (' %s ' % count) if count != '0' else ''

def get_full_count(rss):
    dom = minidom.parseString(rss)
    return dom.getElementsByTagName('fullcount')[0].firstChild.nodeValue

def main():
    cache = File('/tmp/gmail-count')
    try:
        data = json.loads(cache.read())
        if time.time() > data['expires']:
            raise Exception('Cache expired')
    except:
        data = {"content": get_data(),
                "expires": time.time() + LIFETIME}
        cache.clear()
        cache.write(json.dumps(data))
    print(data['content'])


if __name__ == '__main__':
    main()
