# home
This repository manages the applications, CLI tools, and configuration files used in my Mac.

## Philosophy
Prefer simple, explicit, and low-maintenance solutions over complete automation.

The goal is not to automate every step with tools or scripts, but to minimize learning, setup, and maintenance costs. Tasks that remain manual can be handled with assistance from Codex, so this repository itself should remain small and understandable.

## Setup
### 1. Install Xcode CLI
```bash
xcode-select --install
```

This is required to use Git.

### 2. Clone this repo
```bash
git clone git@github.com:spesnova/home.git ~/Projects/github.com/spesnova/home
```

### 3. Install Homebrew
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 4. Install Homebrew packages
```bash
brew bundle --file brew/Brewfile
```

### 5. Continue setup with Codex.
The previous step installs ChatGPT App.

Open this repository in ChatGPT Codex and ask:

```markdown
Set up this Mac according to AGENTS.md.
```
