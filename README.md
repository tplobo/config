# tplobo’s computer config files
Repository to store configuration files for my computers.

![Screenshot of my shell prompt](images/sorry.jpg)

## Studied strategies

General:
- [shell scriptting](https://gist.github.com/mrichman/f5c0c6f0c0873392c719265dfd209e12)
- [aliases in scripts](https://unix.stackexchange.com/questions/1496/why-doesnt-my-bash-script-recognize-aliases)
- [macOS settings](https://github.com/tiiiecherle/osx_install_config)
- [files saved by `mackup`](https://github.com/lra/mackup)

How to save configs:
- [copying](https://github.com/mathiasbynens/dotfiles)
- [Symlinks](https://www.youtube.com/watch?v=r_MpUP6aKiQ)
- [Bare git](https://www.atlassian.com/git/tutorials/dotfiles)
- [Ansible](https://www.youtube.com/watch?v=hPPIScBt4Gw)


## Bootstrap computer ()

1) I Xcode with command line tools: `xcode-select --install`.
2) ...
3) Run `zsh config_bootstrap.sh`.
...
10) Apply config

## Apply computer config
Run `zsh config_apply.sh`. (turn into alias)

## Save computer config
Run `zsh config_save.sh`. (turn into alias)

If adding files to repository after `config_save.sh` fails because of
permissions, [add them with root user](https://stackoverflow.com/questions/6448242/git-push-error-insufficient-permission-for-adding-an-object-to-repository-datab):
- `sudo git add .`
- `sudo chmod -R a+rwX .`
- `sudo find . -type d -exec chmod g+s '{}' +`











