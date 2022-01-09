import sys

from cliff.app import App
from cliff.commandmanager import CommandManager


class ScadToolsApp(App):
    def __init__(self):
        super(ScadToolsApp, self).__init__(
            description='OpenSCAD Tools',
            version='0.1.0',
            command_manager=CommandManager('cliff.scadtools'),
            deferred_help=True,
        )

    def initialize_app(self, _):
        self.LOG.debug('initialize_app')

    def prepare_to_run_command(self, cmd):
        self.LOG.debug(f'prepare to run command {cmd.__class__.__name__}')

    def clean_up(self, cmd, _, err):
        self.LOG.debug(f'clean_up {cmd.__class__.__name__}')
        if err:
            self.LOG.error(f'got an error: {err}')


def main(argv=None):
    if argv is None:
        argv = sys.argv[1:]
    myapp = ScadToolsApp()
    return myapp.run(argv)


if __name__ == '__main__':
    sys.exit(main(sys.argv[1:]))
