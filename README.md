# with

A minimally complete continuous workflow tool, inspired by mchav's [with](https://github.com/mchav/with), written for the Fish shell.

## Installation
You have two options for installation:

1. Clone this repo into your fish functions directory optionally deleting this README
2. Download `with.fish` as is and put into your fish functions directory

Your fish functions directory is almost certainly `~/.config/fish/functions`.

You may need to restart your shell.

### Updating

This repo doesn't change very often and ideally will never change again.
That said, I may update this repo to work with a new version of Fish that I'm using.

1. Pull from your cloned repo
2. Download `with.fish` from this repo

## Usage

### Example

I'm using an @ to show where you can start and end typing, $ for your shell prompt, and # for inline comments.
For example, at a regular shell prompt where you type "hello world":

```
$ @hello world@
```

#### Starting with running git
```
$ @with git@
with> git @@
```
Notice how to start with you type `with git` and that translates to `with> git `, and you can then type after `git ` (notice also the trailing space).

#### Running some common git commands and exiting

```
$ @with git@
with> git @add .@
with> git @commit -m "Some message"@
with> git @log@
with> git @^C@ # Exit with
```

Here we literally typed:

```
with git
add .
commit -m "Some message"
log
^C
```

### Tips and tricks

#### Executing other commands
You can remove the text inserted by `with` up to `with> ` and insert any other text you like which will then be executed:

```
$ @with git@
with> git @[backspace x 4]ls@ # Outputs directory listing
with> git @@ # Our next line is back to what we initially started `with` with.
```
This is very useful for when you want to quickly execute another command and then go back to what you were doing.


Your prompt has been temporarily changed to `with> ` so you can use the usual fish shortcuts!
```
$ @with git@
with> git @add .^A^K@ # Results on next line
with> @@ # "git add ." on clipboard
```

And you can of course add arguments to your commands. These will be executed every time:

```
$ @with ls -l@
with> ls -l @with.fish@ # -rwxrw-r-- 1 user user 248 Jul  8  2017 with.fish*
with> ls -l @[RET]@ # Directory listing in long format
with> ls -l @@
```

## Potential problems

Some versions of Fish appear to keep a separate completion history for commands entered in `with`.
This may or may not be useful to you, but is something to be aware of.

Functions in fish are global and public.
`read_prompt` is therefore in the global scope and must NOT be relied on.
It is treated as private and is subject to removal or renaming at any time.

If you have a function called `read_prompt` in `read_prompt.fish` in your fish function directory it will take precedence over
the one defined in `with.fish`.
`with` will execute your defined `read_prompt` function which may produce strange behaviour.
You can rename either `read_prompt` function, or live with the changed prompt (and potential side effecting behaviour on each execution of `with`).