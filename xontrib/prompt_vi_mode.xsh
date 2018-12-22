"""Prompt formatters 'vi_mode' and 'vi_mode_not_insert'."""

from prompt_toolkit.key_binding import vi_state


__all__ = ()


# Automatically sets $VI_MODE and $UPDATE_PROMPT_ON_KEYPRESS
# as it's kind of pointless without them.
$VI_MODE = True
$UPDATE_PROMPT_ON_KEYPRESS = True


def vi_mode():
    state = __xonsh__.shell.shell.prompter.app.vi_state
    mode = state.input_mode
    if mode == vi_state.InputMode.INSERT:
        return 'INSERT'
    elif mode == vi_state.InputMode.INSERT_MULTIPLE:
        return 'INSERT_MULTIPLE'
    elif mode == vi_state.InputMode.NAVIGATION:
        return 'NORMAL'
    elif mode == vi_state.InputMode.REPLACE:
        return 'REPLACE'
    else:
        return 'NORMAL'


def vi_mode_not_insert():
    mode_str = vi_mode()
    return mode_str if mode_str != 'INSERT' else None


$PROMPT_FIELDS['vi_mode'] = vi_mode
$PROMPT_FIELDS['vi_mode_not_insert'] = vi_mode_not_insert
