# homebrew-tap

Personal Homebrew tap for [Jon Puritz](https://github.com/jpuritz)'s tools.

## Casks

### claude-usage

Menu bar app showing Claude usage limits —
[ClaudeUsageBar](https://github.com/jpuritz/ClaudeUsageBar).

```sh
brew install --cask --no-quarantine jpuritz/tap/claude-usage
```

The `--no-quarantine` flag matters: the build is ad-hoc signed, and without the
flag Gatekeeper blocks the first launch (fixable after the fact with
`xattr -dr com.apple.quarantine "/Applications/Claude Usage.app"`).

This is the menu-bar build. The WidgetKit desktop widget requires building from
source — see the project README.
