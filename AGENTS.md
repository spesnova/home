# AGENTS.md
## Repository Purpose
This repository defines my personal Mac environment as code.

## Setup workflow

When asked to set up a Mac:

### 1. Inspect the current state

Inspect the current machine and repository state.

### 2. Check Homebrew packages

Run `brew bundle check --file brew/Brewfile`.

If any packages are missing, run `brew bundle --file brew/Brewfile`.
If all packages are already installed, skip this step.

### 3. Identify remaining tasks

Identify the remaining configuration tasks based on the repository and machine state.

### 4. Create configuration symlinks

Create the required configuration symlinks.

Do not overwrite an existing file or directory without the user's permission.
If a destination already exists and must be replaced, ask the user before overwriting it.

### 5. Verify the setup

Verify the resulting state.

### 6. Report manual tasks

Report anything that still requires manual interaction.

## Software installation workflow

When asked to install an application or command-line tool:

### 1. Inspect the current state

Check whether the software is already installed and whether it is already listed in `brew/Brewfile`.

If it is installed but missing from the Brewfile, do not reinstall it; add it to the Brewfile.

### 2. Choose the installation source

For applications available from the Mac App Store, use the `mas` CLI instead of opening the App Store application.

If `mas` is not installed, install it with `brew install mas`.

Use `mas search` to find the application, then verify its name, developer, and App Store ID before selecting it.

If the software is not available from the Mac App Store:

- Use a Homebrew formula for command-line tools.
- Use a Homebrew cask for applications.

Do not open or operate the App Store application unless manual sign-in is required or the user explicitly asks.

### 3. Install the software directly

Install only the requested software using the selected source:

- Run `mas install <app-id>` for a Mac App Store application.
- Run `brew install <formula>` for a Homebrew formula.
- Run `brew install --cask <cask>` for a Homebrew cask.

Do not run `brew bundle` for an individual software installation request. Installing the requested software directly avoids upgrading or installing unrelated Brewfile entries.

### 4. Update the Brewfile

After the software has been installed successfully, add it to the appropriate section of `brew/Brewfile`:

- `mas` for Mac App Store applications
- `brew` for command-line tools
- `cask` for applications distributed outside the Mac App Store

### 5. Verify the installation

Verify that the requested software was installed successfully and that its Brewfile entry is correct.

Report anything that still requires authentication, a password, or other manual interaction.

## Global skill management workflow

When asked to add or manage a global agent skill:

### 1. Treat the repository as the source of truth

Store each skill as a local copy under `skills/<skill-name>/`.

The contents of `skills/`, including copied remote skills, are the source of truth for global skills. Do not use a project-level `.agents/skills` directory or `skills-lock.json` in this repository.

### 2. Use the global skills symlink

Ensure `~/.agents/skills` is a symlink to this repository's `skills/` directory.

Do not overwrite an existing file or directory without the user's permission. If the destination must be replaced, ask first unless the user has already explicitly authorized the replacement.

### 3. Add remote skills with pnpm

Use the `skills` CLI through pnpm and install to the global scope:

```bash
pnpm dlx skills@latest add <source> \
  --skill <skill-name> \
  --global \
  --agent codex \
  --copy \
  --yes
```

Select only the requested skills. Because the global skills directory is symlinked into this repository, installed files are written under `skills/`.

Review remote skill contents and their license before retaining them in the repository. Treat updates as normal repository changes and inspect the diff before committing.

Local skills already stored under `skills/` do not need to be installed with the `skills` CLI.

### 4. Verify the skill

Verify that the skill exists under `skills/<skill-name>/`, that `~/.agents/skills` resolves to the repository's `skills/` directory, and that the skill contains a valid `SKILL.md`.

### Managed remote skills

When adding or removing a copied remote skill, update this table in the same change. Do not list locally authored skills.

| Skill | Source |
| --- | --- |

No remote skills are currently managed.

## Directory Structure

```bash
home/
├── AGENTS.md          # Instructions for AI agents working in this repository.
├── README.md          # Overview and setup instructions for humans.
├── brew/
│   └── Brewfile       # Homebrew packages, applications, and Mac App Store apps.
├── codex/
│   └── keybindings.json # Codex App keyboard shortcuts.
├── cursor/
│   └── settings.json  # Cursor editor settings.
├── fish/
│   └── config.fish    # Fish shell configuration.
├── git/
│   └── gitconfig      # Global Git configuration.
└── skills/
    └── <skill-name>/
        └── SKILL.md    # Global agent skill instructions.
```

## Configuration files
| Source | Destination |
| --- | --- |
| `git/gitconfig` | `~/.gitconfig` |
| `fish/config.fish` | `~/.config/fish/config.fish` |
| `cursor/settings.json` | `~/Library/Application Support/Cursor/User/settings.json` |
| `codex/keybindings.json` | `~/.codex/keybindings.json` |
| `skills/` | `~/.agents/skills` |
