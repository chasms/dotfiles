# dotfiles

## Setup
**DO NOT CLONE THIS REPO NORMALLY**

*This is designed as a bare repo, the version control (normally `.git`) will live in `~/.dotfiles` and control files in `~`*

Instead:

```
$ cd ~

$ git clone --bare git@github.com:chasms/dotfiles.git $HOME/.dotfiles

$ alias dotfiles='`which git` --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

$ dotfiles checkout
```

If the last command fails because 'files would be overwritten', stow a backup of the current files and run it again:

```
$ mkdir -p .dotfiles-backup

$ dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .dotfiles-backup/{}

$ dotfiles checkout
```

Finally:

```
$ dotfiles config --local status.showUntrackedFiles no

$ source .bash_profile
```

## Configuration

Use the `dotfiles` command in any working directory to access this repo's `git` commands

  ```
  $ dotfiles status
  $ dotfiles add .vimrc
  $ dotfiles commit -m "Add vimrc"
  $ dotfiles add .bashrc
  $ dotfiles commit -m "Add bashrc"
  $ dotfiles push
  ```

The `.bash_profile` should not require any adjustment, and is configured to load in all files in the `.shell_scripts` directory
  
  * (see the `include` function in `.bash_profile`)

Create functions, utilities, and files in the `.shell_scripts` directory to customize the bash shell

Any files in the `.shell_scripts` directory that you do not want included in version control should be suffixed with `_private`

  * (e.g. `.shell_scripts/.bashrc_private`, see `.gitignore` to see/modify configuration)
