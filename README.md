# tplobo’s computer(s) config files

Repository to store configuration files for my computers.

A screenshot of my shell prompt:
![Screenshot of my shell prompt](images/sorry.jpg)

## Introduction

### Studied strategies and references

General:

- [shell scriptting](https://gist.github.com/mrichman/f5c0c6f0c0873392c719265dfd209e12)
- [aliases in scripts](https://unix.stackexchange.com/questions/1496/why-doesnt-my-bash-script-recognize-aliases)
- [ZSH environment](https://apple.stackexchange.com/questions/388622/zsh-zprofile-zshrc-zlogin-what-goes-where)
- [ZSH expansion](https://thevaluable.dev/zsh-expansion-guide-example/)
- [files saved by `mackup`](https://github.com/lra/mackup)

MacOS:

- [migration](https://www.intego.com/mac-security-blog/setting-up-a-new-mac-should-you-migrate-or-do-a-clean-installation/)
- [macOS settings](https://github.com/tiiiecherle/osx_install_config)
- [`dot_clean` to clean turd dot files in external drives](https://apple.stackexchange.com/a/163498)

How to save configs:

- [copying](https://github.com/mathiasbynens/dotfiles)
- [Symlinks](https://www.youtube.com/watch?v=r_MpUP6aKiQ)
- [Bare git](https://www.atlassian.com/git/tutorials/dotfiles)
- [Ansible](https://www.youtube.com/watch?v=hPPIScBt4Gw)

## Usage

### Bootstrap computer ()

1. Grant Terminal and Script Editor assistive access in:
   `System Preferences > Privacy & Security > Privacy > Accessibility`

1. Install Xcode with command line tools: `xcode-select --install`.

1. ...

1. Run `zsh config_bootstrap.sh`.

1. Transfer data manually from old computer (_i.e._ file/folder is too
   large for `save_preferences`):

   - Home (`~/Documents`, `~/Music`, `~/Movies`, `~/Desktop`, `~/Pictures`)
   - Printer drivers (`/Library/Printers`)
   - iPhone/iPad backups (`~/Application Support/MobileSync/Backup`)
   - Firefox profiles (`~/Library/Application Support/Firefox/Profiles`)
   - Zotero data directory (e.g. `~/Documents/ZOTERO`)
   - JDownloader directory (`/Applications/JDownloader 2.0`)
   - OpenEmu directory (`~/Library/Application Support/OpenEmu`)
   - ...

(Some manual data transfer can be found also inside each respective folder in
the `containers` directory, when `save_preferences` failed and could not be
re-run.)

1. Apply config

### Apply computer config

1. Update links for app installation from urls in `library/url_dmg.sh`

1. Run `zsh config_apply.sh`. (turn into alias)

1. Change things that cannot be set from script:

- Hide "Now Playing" icon in Menu Bar by selecting:
  `System Settings > Control Center > Now Playing > Don't Show`

- Install command `code` by opening VSCode, opening the Command Palette
  and running:
  `> Shell Command: Install 'code' command in PATH`

- Install command `stree` by opening SourceTree and running:
  `Sourcetree > Install Command Line Tools`

- ...

### Save computer config

Run `zsh config_save.sh`. (turn into alias)

If adding files to repository after `config_save.sh` fails because of
permissions, [add them with root user](https://stackoverflow.com/questions/6448242/git-push-error-insufficient-permission-for-adding-an-object-to-repository-datab):

- `sudo git add .`
- `cd .git`
- `sudo chmod -R a+rwX .`
- `sudo find . -type d -exec chmod g+s '{}' +`

## Development

### Repo management

The `fork` branch is static and indicates when the repo was originally forked
from the upstream repo (`mathiasbynens/dotfiles.git`).

The `main` branch is the base on which development commits are added. The
`main` branch should be rebased whenever commits come from the `upstream` repo.

Development commits are made on the `generic` branch, which can be applied to
any computer.
Each specific computer I own has its own branch ("`computer-branch`") and
should be continually rebased on the latest state of `generic` with:

```
git checkout (computer-branch)
git rebase generic
```

or, if in SourceTree ([see this](https://stackoverflow.com/questions/39928132/git-rebase-using-sourcetree)):

1. checkout to `computer-branch`
2. right-click `generic`, select "Rebase..."

Afterwards, if `computer-branch` had any children branches, checkout into each
child branch and [apply a rebase with `--onto`](https://stackoverflow.com/questions/45153926/git-rebase-and-children-branches),
using the commit ID of that child's old parent in the original history
(old-parent), and the commit ID of the equivalent commit in the new history
(new-parent):

```
git rebase --onto (new-parent) (old-parent)
```
