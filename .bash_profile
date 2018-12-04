source ~/.bashrc

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

alias ltmate="tmate_ssh=tmate display -p '#{tmate_ssh}'"

terminate(){
    lsof -P | grep ':3000' | awk '{print $2}' | xargs kill -9 
  }
