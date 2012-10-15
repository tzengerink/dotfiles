#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
    CONNECTION CHECK
    ----------------

    Check if your internet connection is up and running, or wether your not
    connected to the outside world.

    To see all options use the `-h` or `--help` flag.

    Copyright (c) 2012, T. Zengerink
    Licensed under MIT License
    See: https://raw.github.com/gist/3151357/9e8e01df4ee12b1f04cd61e0ecee3ea8bd6f617b/mit-license.txt
"""
import argparse, time, urllib2


def check(url, timeout):
    try:
        response = urllib2.urlopen(url, timeout=5)
        return True
    except urllib2.URLError:
        pass
    return False


def handle_args():
    """Handle the passed arguments."""
    parser = argparse.ArgumentParser()
    parser.add_argument('url',
                        default='http://www.google.com',
                        help='URL to check connection to',
                        nargs='*')
    parser.add_argument('-t', '--timeout',
                        default=5,
                        dest='timeout',
                        help='Timeout to accept while connecting',
                        nargs='*')
    return parser.parse_args()


def main():
    args = handle_args()
    try:
        status = None
        while True:
            result = check(args.url, args.timeout)
            if status is None or result is not status:
                status = result
                if status:
                    print ("[" + time.strftime("%H:%M:%S") + "] Online")
                else:
                    print ("[" + time.strftime("%H:%M:%S") + "] Offline")

            time.sleep(args.timeout)
    except KeyboardInterrupt:
        exit(0)


if __name__ == '__main__':
    main()
