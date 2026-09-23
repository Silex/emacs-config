# AGENTS.md

This file covers only what is specific to this repo.

## What this is

A personal Emacs configuration. `.emacs` bootstraps `straight.el` and loads the files under
`config/`, one per area.

## Conventions

- Set user options (variables for which `custom-variable-p` is true) through the `:custom` keyword
  of `use-package`, never with `setq` in `:config`. `:custom` runs the option's `:set` function,
  which `setq` bypasses. Options that belong to no package go in the `use-package emacs` block's
  `:custom`. Keep `setq` and `setq-default` for plain `defvar` variables.
