#!/usr/bin/env python

"""
    COLORED SVN COMMANDS
    --------------------
    Creates a colored output for some of the subcommands of SVN. Supported
    subcommands include add, diff, remove and status.

    Personal modification of https://gist.github.com/517913
"""
import os, sys, re, subprocess

tabsize = 2

colorizedSubcommands = (
    'add',
    'diff',
    'remove',
    'status',
)

statusColors = {
    "-"  : "31",    # red
    "A"  : "32",    # green
    "C"  : "30;41", # black on red
    "D"  : "31",    # bold red
    "M"  : "31",    # red
    "X"  : "37",    # grey
    "\+" : "32",    # green
    "\?" : "33",    # yellow
}

def colorize(line):
    for color in statusColors:
        if re.match(color, line):
            return ''.join(("\001\033[", statusColors[color], "m", line,
                "\033[m\002"))
    else:
        return line

def escape(s):
    s = s.replace('"', r'\"')
    s = s.replace('$', r'\$')
    s = s.replace('`', r'\`')
    return s

passthru = lambda x: x
quoted = lambda x: '"%s"' % escape(x)

if __name__ == "__main__":
    cmd = ' '.join(['svn']+[(passthru, quoted)[' ' in arg](arg)
        for arg in sys.argv[1:]])
    output = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE)
    cancelled = False
    for line in output.stdout:
        line = line.expandtabs(tabsize)
        if(sys.argv[1] in colorizedSubcommands):
            line = colorize(line)
        try:
            sys.stdout.write(line)
        except:
            sys.exit(1)
