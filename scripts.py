#!/usr/bin/env python
import os
from docopt import docopt
import re


class SuperCommander(object):
    """Usage:
        scripts.py <SHELL_COMMAND> [options]

    Arguments:
        SHELL_COMMAND   Input that will be applied to every selected folder

    Options:
        -p --preview     Prints the commands that would be executed
        -g --git         Performs operations only in folders containing git repos
        -r --recursive   Recursively perform the operations, use carefully
    """

    def __init__(self):
        self._cwd = os.getcwd()
        self._arguments = docopt(self.__doc__)

        sanity_filter = re.compile('[rm|rm -[rf|fr]]')

        if sanity_filter.search(self._arguments['<SHELL_COMMAND>']) is not None:
            raise Exception('BE CAREFUL DONT DO THAT')

    def run(self):
        self.do_all_the_things()

    def do_all_the_things(self):
        for folder in self._selected_folders():
            system_call = 'cd %s && %s' % (folder, self._arguments['<SHELL_COMMAND>'])
            print(system_call)
            if not self._arguments['--preview']:
                os.system(system_call)

    def _top_level_folders(self):
        return [os.path.abspath(name) for name in os.listdir(self._cwd) if os.path.isdir(name)]

    def _selected_folders(self):
        if self._arguments['--git']:
            raise NotImplementedError()
        elif self._arguments['--recursive']:
            raise NotImplementedError()
        return self._top_level_folders()

    # TODO: allow running the commands against all folders that are git repos
    def _all_nested_git_repositories(self):
        pass


if __name__ == "__main__":
    SuperCommander().run()
