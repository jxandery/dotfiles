source ~/.bashrc

alias ltmate="tmate_ssh=tmate display -p '#{tmate_ssh}'"

terminate(){
    lsof -P | grep ':3000' | awk '{print $2}' | xargs kill -9
  }
export PATH=$HOME/bin:$HOME/.local/bin:.git/safe/../../bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:~/dotfiles/hr/bin

export BASH_SILENCE_DEPRECATION_WARNING=1

. "$HOME/.asdf/asdf.sh"

. "$HOME/.asdf/completions/asdf.bash"

# heroku autocomplete setup
HEROKU_AC_BASH_SETUP_PATH=/Users/jackyeh/Library/Caches/heroku/autocomplete/bash_setup && test -f $HEROKU_AC_BASH_SETUP_PATH && source $HEROKU_AC_BASH_SETUP_PATH;

eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="/opt/homebrew/opt/libxml2/bin:$PATH"
export PATH="/opt/homebrew/opt/libxslt/bin:$PATH"

# Setting PATH for Python 3.13
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.13/bin:${PATH}"
export PATH

export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export GEM_HOME="$HOME/.gem"

export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
