#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
    REMOTE HOST
    -----------
    Store a variable containing the remote host for easy remote interactions
    within terminal session.

    Copyright (c) 2012-2013 T. Zengerink
    Licensed under MIT License
    See: https://raw.github.com/gist/3151357/9e8e01df4ee12b1f04cd61e0ecee3ea8bd6f617b/mit-license.txt
"""
import argparse, os, subprocess


FILE_PATH = '/tmp/tmux-remote-host'


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


def main(args):
    file = File(FILE_PATH)
    hostname = str(file.read()).strip()
    if args.switch:
        file.clear()
        os.system("tmux display-message -p '#S' > %s" % FILE_PATH)
        exit(0)
    if args.display:
        if hostname:
            print(' %s ' % hostname)
        else:
            print('')
        exit(0)
    if args.command:
        if hostname:
            print('ssh %s' % hostname)
        exit(0)
    if args.host:
        file.clear()
        file.write(args.host)
    else:
        file.clear()

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--display', action='store_true', default=False,
                        dest='display')
    parser.add_argument('--command', action='store_true', default=False,
                        dest='command')
    parser.add_argument('--switch', action='store_true', default=False,
                        dest='switch')
    parser.add_argument('host', default=False, nargs='?')
    main(parser.parse_args())
