# Ship Script

A small script that creates PRs following the convention of the [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) specification.

This is a simplified non-AI version of [Creating AI-Powered Pull Requests with Mods](https://medium.com/@dangrondahl/creating-ai-powered-pull-requests-with-mods-ca694fcda22e)

## Pre-requisites

- GitHub CLI installed and authenticated.

  ```bash
  brew install gh
  gh auth login
  ```

- Charmbracelet's Gum for shell glamour.

  ```bash
  brew install gum
  ```

## Installation

1. Save the script somewhere in your path.

```bash
~/.local/bin/ship
```

## Usage

```bash
ship
```

Follow the prompts to create a PR.
