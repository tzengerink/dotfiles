#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
    LOADAVG
    -------
    Get the systems load averages

    Copyright (c) 2012-2013 T. Zengerink
    Licensed under MIT License
    See: https://raw.github.com/gist/3151357/9e8e01df4ee12b1f04cd61e0ecee3ea8bd6f617b/mit-license.txt
"""
import math, multiprocessing, os, sys

def help():
    print('Usage %s [1, 5, 15]' % sys.argv[0])
    exit(1)

def round(s):
    return '%.2f' % float(s)

def main(arg):
    load = os.getloadavg()
    loads = {
        '1': round(load[0]),
        '5': round(load[1]),
        '15': round(load[2]),
    }
    colors = {
        '1': '#[fg=colour217]',
        '5': '#[fg=colour167]',
        '15': '#[fg=colour124]',
    }
    try:
        cpu_count = multiprocessing.cpu_count()
        color = '' if float(loads[arg]) / cpu_count < 1 else colors[arg]
        print('%s %s' % (color, loads[arg]))
    except Exception as e:
        print(e)
        help()

if __name__ == '__main__':
    if len(sys.argv) < 2:
        help()
    main(sys.argv[1])

