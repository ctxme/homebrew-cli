# ctxme Homebrew Tap

Install the CLI:

```bash
brew install ctxme/cli/ctxme
```

That adds this tap and installs the CLI. Both `ctxme` and `ctx` are
placed on your PATH; they are the same command.

Upgrade:

```bash
brew upgrade ctxme
```

## Why the fully-qualified name?

Homebrew requires formulae from non-official taps to be trusted before
it will load them (`HOMEBREW_REQUIRE_TAP_TRUST`, on by default since
Homebrew 6). Naming the formula explicitly grants that trust, so the
command above just works - and later `brew install ctxme` /
`brew upgrade ctxme` work too, because the formula stays trusted.

Tapping first is equivalent but needs an explicit trust step, since a
bare `brew install ctxme` names no tap for Homebrew to trust:

```bash
brew tap ctxme/cli
brew trust ctxme/cli
brew install ctxme
```

Without the middle command the install fails with
`Refusing to load formula ctxme/cli/ctxme from untrusted tap ctxme/cli`.

## Upgrading from the old `cli` formula

This formula used to be named `cli`. `formula_renames.json` migrates an
existing keg automatically on `brew upgrade`. The trust rule above still
applies, because the renamed formula is one you never installed by name,
so run `brew trust ctxme/cli` once if the upgrade reports the tap is
untrusted.

You should have an account on https://ctx.me.
