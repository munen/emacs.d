# Block distracting sites during a Pomodoro

## Context

During a Pomodoro some websites should be unreachable; during breaks and
after the Pomodoro they should work again. LeechBlock (Firefox) cannot be
driven from outside. SelfControl 4.0.2 (`brew install --cask selfcontrol`)
was tested on macOS 27.2.1: `selfcontrol-cli start --blocklist FILE
--enddate ISO8601` blocks via `/etc/hosts` and pf without a password
prompt once its daemon is installed, and lifts the block at the end date.
A block cannot be ended early, and a second `start` while a block runs
fails with "Block is already running" (exit 78).

## Approach

- `ok-pomodoro-blocked-hosts` (defcustom, default nil): hosts to block.
- `ok-pomodoro-selfcontrol-cli` (defcustom): path to `selfcontrol-cli`.
- `ok-pomodoro-start` writes the hosts as a SelfControl blocklist plist
  to a temp file and runs `selfcontrol-cli start` asynchronously with the
  end time of the work phase. The block ends with the work phase, so
  breaks are unblocked without further action.
- Does nothing when the host list is empty or the CLI is not executable
  (e.g. on Linux), so the same config works on every machine.
- A failed start is reported with `message`; "already running" (cancel,
  then restart) is reported as such: the earlier block still holds until
  its own end time.

Known limitation: cancelling a Pomodoro does not unblock early.

## Files

- `ok-pomodoro.el`: defcustoms, blocklist writer, async start, call in
  `ok-pomodoro-start`.
- `configuration.org`: document blocking in the Pomodoro section and set
  `ok-pomodoro-blocked-hosts` (news.ycombinator.com, reddit.com,
  youtube.com, instagram.com).

## Verification

- Byte-compile `ok-pomodoro.el` without warnings.
- In batch Emacs with a 1-minute pattern and `example.com` only: start a
  Pomodoro, check `selfcontrol-cli is-running` and `/etc/hosts`, then
  check that the block is gone after the end time.
- With `ok-pomodoro-selfcontrol-cli` set to a missing path, start works
  and blocks nothing.
