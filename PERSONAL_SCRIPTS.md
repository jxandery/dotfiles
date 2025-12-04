# Personal Scripts Setup

This dotfiles repository includes script management functions in `.bashrc`, but the actual scripts live in `~/bin/` (machine-specific).

## Quick Setup on New Machine

After installing dotfiles, create your `~/bin/` directory:

```bash
mkdir -p ~/bin
```

The PATH is already configured in `.bashrc`:
```bash
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"
```

## Script Management Commands

These functions are automatically available after sourcing `.bashrc`:

- `scripts` or `my-scripts` - List all scripts with descriptions
- `scripts-search KEYWORD` - Search scripts by keyword
- `scripts-help` - View ~/bin/README.md
- `edit-script NAME` - Edit or create a script

## Creating a New Script

```bash
edit-script my-tool
```

This creates a template with proper headers:
```bash
#!/bin/bash
# Description: What this script does
# Usage: my-tool [arguments]

# Your code here
```

## Script Categories

Common patterns for organizing scripts:

- `project-*` - Project-specific tools (e.g., `gc-discover`, `gc-ticket`)
- `*-auth.sh` - Authentication helpers (uses Keychain)
- `fetch-*.sh` - Data fetching tools
- `claude-*` - Claude Code integration scripts
- `join-*` - Session management

## Keychain Integration

For scripts needing credentials, store them in macOS Keychain:

```bash
# Store a credential
security add-generic-password -a "$USER" -s "service-name" -w "value"

# Retrieve in script
VALUE=$(security find-generic-password -s "service-name" -w 2>/dev/null)
```

Example: Confluence integration uses:
- `confluence-email` - Email address
- `confluence-api-token` - API token

## Backup Strategy

Since `~/bin/` is machine-specific and not in dotfiles:

**Option 1: Git Repository**
```bash
cd ~/bin
git init
git add .
git commit -m "Initial commit"
git remote add origin <your-private-repo>
git push -u origin main
```

**Option 2: Cloud Sync**
Symlink to Dropbox/iCloud:
```bash
mv ~/bin ~/Dropbox/bin
ln -s ~/Dropbox/bin ~/bin
```

**Option 3: Manual Backup**
Periodically copy to dotfiles for reference:
```bash
tar czf ~/dotfiles/backups/bin-backup-$(date +%Y%m%d).tar.gz ~/bin
```

## Portable vs. Machine-Specific Scripts

**Portable scripts** (could be in dotfiles):
- Generic utilities that work anywhere
- No hardcoded paths
- No machine-specific credentials

**Machine-specific scripts** (keep in ~/bin):
- Reference local project paths
- Use machine Keychain credentials
- Project-specific tooling (gc-*, claude-*)

## Example Scripts to Start With

Create these common utilities:

```bash
# Git workflow
edit-script git-cleanup
edit-script git-branch-date

# Project navigation
edit-script goto-project
edit-script recent-projects

# Development tools
edit-script dev-setup
edit-script test-watch
```

## Tips

1. **Prefix conventions** help organize scripts:
   - `git-*` for Git tools
   - `docker-*` for Docker tools
   - `<project>-*` for project-specific tools

2. **Always add descriptions** - Makes `scripts` command useful:
   ```bash
   # Description: Does something useful
   ```

3. **Make scripts idempotent** - Safe to run multiple times

4. **Document dependencies** - Add comments about required tools:
   ```bash
   # Requires: jq, curl
   ```

5. **Use `set -e`** for error handling:
   ```bash
   #!/bin/bash
   set -e  # Exit on error
   ```
