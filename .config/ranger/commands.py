# -*- coding: utf-8 -*-

from ranger.api.commands import *


class touch(Command):
    """Creates a file in the current working directory.
    :touch <filename>
    """
    def execute(self):
        if not self.arg(1):
            self.fm.notify("Syntax: touch <filename>", bad=True)
        else:
            self.fm.run('touch '+self.arg(1))


class trash(Command):
    """Trash a file.
    :trash <filename>
    """
    def execute(self):
        if not self.arg(1):
            self.fm.notify("Syntax: trash <filename>", bad=True)
        else:
            self.fm.run('mv '+self.arg(1)+' ~/.trash/')


class empty(Command):
    """Empties the trash.
    :empty
    """
    def execute(self):
        self.fm.run("rm -rf ~/.trash/{*,.[^.]*}")
