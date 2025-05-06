# GPG with Git

## `gpg-agent.conf`

```
allow-loopback-pinentry
pinentry-program /usr/bin/pinentry
max-cache-ttl 43200
default-cache-ttl 43200
```

The `pinentry-program` can be done with: `echo "pinentry-program $(which pinentry) >> ~/.gnupg/gpg-agent.conf`
The cache-ttl values mean the passphrase has to be entered every 12 hours.

## `gpg.conf`

```
use-agent
```

## bashrc

This needs to be in bashrc:

```
export GPG_TTY=$(tty)
```

## Git

- `user.signingkey` to the key id of the key which email matches the `user.email` email.
- `commit.gpgsign` true to sign every commit.
- `gpg.program` either `$(which gpg)` or see below for support inside vim.

## Fugitive / Vim

To get commit signing inside vim, you need to add this script to `/usr/local/bin` or any other path
that precedes `/usr/bin`:

```sh
#!/bin/sh

if [ -n "$FUGITIVE" ]; then
  set -- --pinentry-mode loopback "$@"
fi
exec /usr/bin/gpg "$@"
```

Make sure exec permissions are added.
I called this script `gpg-override`.

Then set `gpg.program` in git config to this script:

```sh
git config --global gpg.program /usr/local/bin/gpg-override
```
