source ~/.bashrc

alias ltmate="tmate_ssh=tmate display -p '#{tmate_ssh}'"

terminate(){
    lsof -P | grep ':3000' | awk '{print $2}' | xargs kill -9 
  }
export PATH=.git/safe/../../bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:~/dotfiles/hr/bin

export BASH_SILENCE_DEPRECATION_WARNING=1

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash

# heroku autocomplete setup
HEROKU_AC_BASH_SETUP_PATH=/Users/jackyeh/Library/Caches/heroku/autocomplete/bash_setup && test -f $HEROKU_AC_BASH_SETUP_PATH && source $HEROKU_AC_BASH_SETUP_PATH;

eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="/opt/homebrew/opt/libxml2/bin:$PATH"
export PATH="/opt/homebrew/opt/libxslt/bin:$PATH"

# Added by Windsurf
export PATH="/Users/jackyeh/.codeium/windsurf/bin:$PATH"

. "$HOME/.local/bin/env"

# Setting PATH for Python 3.13
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.13/bin:${PATH}"
export PATH
