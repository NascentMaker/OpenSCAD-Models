import logging
import os
import re

from cliff.command import Command


class Inline(Command):
    """Inline all files in use/include statements."""

    log = logging.getLogger(__name__)
    outfile = None
    filenames = []
    statement_regex = re.compile('(use|include) <[^>]+>')

    def get_parser(self, prog_name):
        parser = super(Inline, self).get_parser(prog_name)
        parser.add_argument('filename', nargs='?')
        return parser

    def scan_file(self, filename):
        basename = os.path.basename(filename)
        if basename not in self.filenames:
            self.log.debug(basename)
            self.filenames.append(basename)
            with open(filename, mode='r') as infile:
                self.log.debug(f'opening {filename}...')
                directory = os.path.dirname(filename)
                for line in infile.readlines():
                    if self.statement_regex.match(line.lstrip().rstrip()):
                        incl_file = os.path.join(directory, line[line.index('<') + 1:line.index('>')])
                        if os.path.isfile(incl_file):
                            file_path = os.path.abspath(incl_file)
                            self.scan_file(file_path)
                    else:
                        self.outfile.write(line.rstrip() + '\n')

    def take_action(self, parsed_args):
        self.log.debug('parsed_args: %s', parsed_args)
        try:
            infile = os.path.abspath(parsed_args.filename)
            directory = os.path.dirname(infile)
            with open(os.path.join(directory, f'inline-{os.path.basename(infile)}'), 'w') as self.outfile:
                self.scan_file(infile)
        except FileNotFoundError:
            self.log.error(f'No such file or directory: {parsed_args.filename}')
