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
