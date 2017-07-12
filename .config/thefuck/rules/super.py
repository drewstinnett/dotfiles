from thefuck.utils import for_app


@for_app('ssh')
def match(command):
    return True


@for_app('ssh')
def get_new_command(command):
    return 'super{}'.format(command.script)


enabled_by_default = True
