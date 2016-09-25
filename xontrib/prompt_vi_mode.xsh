"""Prompt formatters 'vi_mode' and 'vi_mode_not_insert'."""

import builtins
from prompt_toolkit.key_binding import vi_state


__all__ = ()


# Automatically sets $VI_MODE and $XONSH_UPDATE_PROMPT_ON_KEYPRESS
# as it's kind of pointless without them.
$VI_MODE = True
$XONSH_UPDATE_PROMPT_ON_KEYPRESS = True


def vi_mode():
    state = builtins.__xonsh_shell__.prompter.cli.vi_state
    mode = state.input_mode
    if mode == vi_state.InputMode.INSERT:
        return 'INSERT'
    elif mode == vi_state.InputMode.NAVIGATION:
        return 'NORMAL'
    elif mode == vi_state.InputMode.REPLACE:
        return 'REPLACE'
    else:
        return 'NORMAL'


def vi_mode_not_insert():
    mode_str = vi_mode()
    return mode_str if mode_str != 'INSERT' else None


$FORMATTER_DICT['vi_mode'] = vi_mode
$FORMATTER_DICT['vi_mode_not_insert'] = vi_mode_not_insert
