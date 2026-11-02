<div align="center">

<img src="https://kiwicanopy.com/brand/icon-512.png" alt="KiwiCanopy" width="96">

# KiwiCanopy Homebrew tap

Homebrew casks for [KiwiCanopy](https://kiwicanopy.com) apps.

</div>

| App | Install |
|---|---|
| [KiwiDesk](https://kiwidesk.kiwicanopy.com/), a tiling window manager for macOS | `brew install --cask kiwicanopy/tap/kiwidesk` |

Apple silicon Macs on macOS 14 Sonoma or later.

Use the full name, `kiwicanopy/tap/kiwidesk`. Since Homebrew 6 a
cask from a third-party tap installs only once you trust it, and
naming it in full trusts that one cask.

## Updates

KiwiDesk updates itself through its built-in updater. `brew upgrade`
also upgrades it whenever the installed app is older than the cask,
and skips it once the app has updated itself. To leave updates to
the app alone:

```sh
export HOMEBREW_NO_UPGRADE_AUTO_UPDATES_CASKS=1
```

## Uninstall

```sh
brew uninstall --cask kiwidesk
```

Add `--zap` to also remove KiwiDesk's settings, profiles and
caches, including `~/.config/KiwiDesk`. Back that folder up first if
you may come back.

## Other ways to install

A signed download from [kiwidesk.kiwicanopy.com](https://kiwidesk.kiwicanopy.com/).

## Contributing

KiwiDesk's release workflow updates `Casks/kiwidesk.rb` for every
release, so a change to its version or digest here is overwritten.
Report problems with the app in
[KiwiCanopy/KiwiDesk](https://github.com/KiwiCanopy/KiwiDesk/issues).

## License

The cask and the files in this repository are [MIT](LICENSE).
KiwiDesk itself is licensed under
[BSL 1.1](https://github.com/KiwiCanopy/KiwiDesk/blob/main/LICENSE).
