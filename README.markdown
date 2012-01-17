# dotfiles

My config files. Very prejudiced mix: Ubuntu, zsh, Ruby, Rails, git, rvm, vim. 
If you match up along most of those lines, you may dig my dotfiles.

## install

- `git clone git://github.com/thedeeno/dotfiles ~/.dotfiles`
- `cd ~/.dotfiles`
- `rake install`

The install rake task will symlink the appropriate files in `.dotfiles` to your
home directory. Everything is configured and tweaked within `~/.dotfiles`,
though.

## what's inside

A lot of what's inside is just aliases: `gs` for `git status`, `gl` for `git
pull --rebase --prune`, for example. You can browse the `aliases.zsh` file.
There's also a collection of scripts in `bin` you can browse. A few notable 
ones:

###system
- `c` is an autocomplete shortcut to your projects directory. For example, `c
  git` and then hitting tab will autocomplete to `github`, and then it simply
  changes to my `github` directory. The projects directory is defined in
  [`zsh/zshrc.symlink`](https://github.com/holman/dotfiles/blob/master/zsh/zshrc.symlink).
- `check [filename]` is a quick script that tells you whether a domain is
  available to register.
- `smartextract [filename]` will extract about a billion different
  compressed/uncompressed/whatever files and you'll never have to remember the
  syntax.
- `backup` is a quick hook into `rsync` to backup a selection of files. Check
  out the comments for more details.

###fun
- `cloudapp` uploads any file to [CloudApp](http://getcloudapp.com).

##moar custom
There are a few things I use to make my life awesome. They're not a required
dependency, but if you make it happen, THEY'LL MAKE **YOU** HAPPEN.

- If you want some more colors for things like `ls`, install grc: `brew install
  grc`.
- If you install the excellent [rvm](http://rvm.beginrescueend.com) to manage
  multiple rubies, your current branch will show up in the prompt. Bonus.


## thanks

I forked [Zach Holeman's](http://github.com/holman) and later merged in 
[Ryan Bate's](http://github.com/ryanb)' dotfiles. They were a fantastic starting
point.
