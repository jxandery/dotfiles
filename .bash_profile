source ~/.bashrc

alias ltmate="tmate_ssh=tmate display -p '#{tmate_ssh}'"

terminate(){
    lsof -P | grep ':3000' | awk '{print $2}' | xargs kill -9 
  }
export PATH=.git/safe/../../bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:~/dotfiles/hr/bin
export PATH="/usr/local/opt/postgresql@10/bin:$PATH"

export BASH_SILENCE_DEPRECATION_WARNING=1

. "$HOME/.asdf/asdf.sh"

. "$HOME/.asdf/completions/asdf.bash"

# heroku autocomplete setup
HEROKU_AC_BASH_SETUP_PATH=/Users/jackyeh/Library/Caches/heroku/autocomplete/bash_setup && test -f $HEROKU_AC_BASH_SETUP_PATH && source $HEROKU_AC_BASH_SETUP_PATH;

export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export GEM_HOME="$HOME/.gem"


eval "$(/opt/homebrew/bin/brew shellenv)"

# Added by Windsurf
export PATH="/Users/jyeh/.codeium/windsurf/bin:$PATH"
