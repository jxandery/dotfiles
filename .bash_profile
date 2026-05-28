alias ltmate="tmate_ssh=tmate display -p '#{tmate_ssh}'"

terminate(){
    lsof -P | grep ':3000' | awk '{print $2}' | xargs kill -9
  }
export PATH=$HOME/bin:$HOME/.local/bin:.git/safe/../../bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:~/dotfiles/hr/bin

export BASH_SILENCE_DEPRECATION_WARNING=1

# asdf version manager (Intel Homebrew location - TODO: migrate to Apple Silicon)
. "/usr/local/opt/asdf/libexec/asdf.sh"

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
export PATH="$HOME/.gem/bin:$PATH"

export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
export GITHUB_TOKEN=$(gh auth token)

alias my-changes='git diff develop...HEAD --name-status'

# Source .bashrc last so its PATH additions (gc-orchestrator/bin, .sharedrc)
# survive the hardcoded PATH export above.
source ~/.bashrc
