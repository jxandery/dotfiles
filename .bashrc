# ~/.bashrc
# vim:set ft=sh sw=2 sts=2:
source "$HOME/.sharedrc"

# Store 10,000 history entries
export HISTSIZE=10000
# Don't store duplicates
export HISTCONTROL=erasedups
# Append to history file
shopt -s histappend

VISUAL=vim
EDITOR="$VISUAL"
LESS="FRX"
RI="--format ansi -T"
PSQL_EDITOR='vim -c"setf sql"'
CLICOLOR=1
LSCOLORS=gxgxcxdxbxegedabagacad

export VISUAL EDITOR LESS RI PSQL_EDITOR CLICOLOR LSCOLORS

if [ -t 1 ]; then
bind 'set bind-tty-special-chars off'
bind '"\ep": history-search-backward'
bind '"\en": history-search-forward'
bind '"\C-w": backward-kill-word'
bind '"\C-q": "%-\n"'
fi

export HISTIGNORE="%*"

[ -z "$PS1" ] || stty -ixon

prefix=
if [ -n "$SSH_CONNECTION" ]; then
  prefix="\[\033[01;33m\]\u@\h"
else
  prefix="\[\033[01;32m\]\u"
fi

[ -z "$PS1" ] || export PS1="$prefix\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]\$(git_prompt_info '(%s)')$ "

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

find-up () {
    path=$(pwd)
    while [[ "$path" != "" && ! -e "$path/$1" ]]; do
        path=${path%/*}
    done
    echo "$path"
}

# Claude Prompt Tracker: Auto-install slash commands in new projects
claude_auto_setup() {
    if [ -d "$PWD/.claude" ] && [ ! -d "$PWD/.claude/commands" ]; then
        TRACKER_COMMANDS="$HOME/claude-projects/prompt-tracker/templates/claude-commands"
        if [ -d "$TRACKER_COMMANDS" ]; then
            echo "📊 Installing prompt tracker slash commands..."
            mkdir -p "$PWD/.claude/commands"
            cp -r "$TRACKER_COMMANDS"/* "$PWD/.claude/commands/" 2>/dev/null && \
            echo "✓ Commands installed: /prompt-stats, /search-prompts, /analyze-my-prompts"
        fi
    fi
}

# Auto-run Claude prompt tracker setup when changing directories
cd() {
    builtin cd "$@"
    claude_auto_setup
}
alias ibrew="arch -x86_64 brew"
export PATH="/usr/local/homebrew/bin:$PATH"
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# Quick command to list all Claude Code projects
alias claude-projects='echo "=== Claude Code Projects ==="; find ~/src ~/claude-projects ~ -maxdepth 2 -name ".claude" -type d 2>/dev/null | sed "s|/.claude||" | grep -Ev "^$HOME\$" | sort'

# Claude Prompt Tracker CLI
export PATH="/Users/jyeh/claude-projects/prompt-tracker/bin:$PATH"

# List all personal helper scripts with descriptions
my-scripts() {
    echo "=== Personal Helper Scripts (~/bin) ==="
    echo ""
    for script in ~/bin/*; do
        if [ -f "$script" ] && [ -x "$script" ]; then
            name=$(basename "$script")
            # Extract description from script header (looks for "# Description:" or first comment line)
            desc=$(grep -E "^# (Description:|Usage:)" "$script" | head -1 | sed 's/^# *//' | sed 's/Description: *//')
            if [ -z "$desc" ]; then
                # If no explicit description, get first comment line
                desc=$(grep -E "^#" "$script" | head -1 | sed 's/^# *//')
            fi
            printf "  %-35s %s\n" "$name" "$desc"
        fi
    done
    echo ""
    echo "Tip: Use 'my-scripts search KEYWORD' to find specific scripts"
}

# Search scripts by keyword
my-scripts-search() {
    if [ -z "$1" ]; then
        echo "Usage: my-scripts search KEYWORD"
        return 1
    fi
    echo "=== Searching scripts for: $1 ==="
    grep -l -i "$1" ~/bin/* 2>/dev/null | while read script; do
        name=$(basename "$script")
        echo "  $name"
        grep -i -n --color=always "$1" "$script" | head -3
        echo ""
    done
}

# Alias for convenience
alias scripts='my-scripts'
alias scripts-search='my-scripts-search'

# View script documentation
scripts-help() {
    if [ -f ~/bin/README.md ]; then
        less ~/bin/README.md
    else
        echo "No README found in ~/bin"
    fi
}

# Edit a script quickly
edit-script() {
    if [ -z "$1" ]; then
        echo "Usage: edit-script SCRIPT_NAME"
        echo "Available scripts:"
        ls ~/bin/ | grep -v README | column
        return 1
    fi

    script_path="$HOME/bin/$1"
    if [ ! -f "$script_path" ]; then
        echo "Script not found: $script_path"
        echo "Creating new script..."
        cat > "$script_path" << 'EOF'
#!/bin/bash
# Description: [Add description here]
# Usage: [Add usage here]

# Your code here
EOF
        chmod +x "$script_path"
    fi

    ${EDITOR:-vim} "$script_path"
}
