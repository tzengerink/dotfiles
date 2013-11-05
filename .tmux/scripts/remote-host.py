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
import argparse, os


class RemoteHost:
    def __init__(self, file_path='/tmp/tmux-remote-host'):
        self.file_path = file_path
    def get_hostname(self, format='%s'):
        try:
            with open(self.file_path, 'r') as file:
                return format % str(file.readline()).strip()
        except:
            return ''
    def set_hostname(self, hostname):
        os.system('echo "%s" > %s' % (hostname, self.file_path))
    def get_ssh_command(self):
        hostname = self.get_hostname()
        return 'ssh %s' % hostname if hostname else ''
    def switch_hostname(self):
        os.system("tmux display-message -p '#S' > %s" % self.file_path)


def main(args):
    remote = RemoteHost()
    if args.command:
        print(remote.get_ssh_command())
        exit(0)
    if args.display:
        print(remote.get_hostname(' %s '))
        exit(0)
    if args.switch:
        remote.switch_hostname()
        exit(0)
    remote.set_hostname(args.host)


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('-c', '--command', action='store_true', default=False,
                        dest='command')
    parser.add_argument('-d', '--display', action='store_true', default=False,
                        dest='display')
    parser.add_argument('-s', '--switch', action='store_true', default=False,
                        dest='switch')
    parser.add_argument('host', default='', nargs='?')
    main(parser.parse_args())
