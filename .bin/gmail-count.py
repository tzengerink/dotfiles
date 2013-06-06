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
import urllib2

from os.path import dirname, realpath
from xml.dom import minidom


def get_rss(user, password):
    auth = urllib2.HTTPBasicAuthHandler()
    auth.add_password(realm='New mail feed',
                      uri='https://mail.google.com',
                      user='%s@gmail.com' % user,
                      passwd=password)
    urllib2.install_opener(urllib2.build_opener(auth))
    return urllib2.urlopen('https://mail.google.com/mail/feed/atom').read()

def get_full_count(rss):
    dom = minidom.parseString(rss)
    return dom.getElementsByTagName('fullcount')[0].firstChild.nodeValue

def main():
    home = dirname(dirname(dirname(realpath(__file__))))
    try:
        with file('%s/.gmail-pass' % home) as f:
            password = f.read()
    except:
        print('Could not read password file (%s/.gmail-pass).' % home)
        exit(1)
    count = get_full_count(get_rss('t.zengerink', password))
    print(count if count != '0' else '')


if __name__ == '__main__':
    main()
