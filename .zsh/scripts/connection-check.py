#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
    CONNECTION CHECK
    ----------------

    Check if your internet connection is up and running, or wether you're not
    connected to the outside world.

    The script keeps checking if a connection can be established, as long as
    there are no changes, no output will be given.

    To see all options use the `-h` or `--help` flag.

    Copyright (c) 2012-2013 T. Zengerink
    Licensed under MIT License
    See: https://raw.github.com/gist/3151357/9e8e01df4ee12b1f04cd61e0ecee3ea8bd6f617b/mit-license.txt
"""
import argparse, time, urllib2


def check(url, to):
    """Check if a connection to an URL can be made.
    url -- URL to check connection with.
    to  -- Timeout to accept when connecting.
    """
    try:
        response = urllib2.urlopen(url, None, to)
        return True
    except urllib2.URLError:
        pass
    return False


def handle_args():
    """Handle the passed arguments."""
    parser = argparse.ArgumentParser()
    parser.add_argument('url',
                        default='http://www.google.com',
                        help='URL to fetch when checking connection',
                        nargs='?')
    parser.add_argument('-t', '--timeout',
                        default=5,
                        dest='timeout',
                        help='Timeout to accept while connecting',
                        nargs='?',
                        type=int)
    parser.add_argument('-s', '--sleep',
                        default=10,
                        dest='sleep',
                        help='Number of seconds to wait before trying again',
                        nargs='?',
                        type=int)
    return parser.parse_args()


def main():
    args = handle_args()
    status = None
    try:
        while True:
            result = check(args.url, args.timeout)
            if result is not status:
                status = result
                print("[" + time.strftime("%H:%M:%S") + "] "
                     + ("OK" if status else "OFFLINE"))
            time.sleep(args.sleep)
    except KeyboardInterrupt:
        exit(0)


if __name__ == '__main__':
    main()
