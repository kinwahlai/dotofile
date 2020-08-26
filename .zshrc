##
# Darren's ZSH Configuration
# created on 24/07/2020
##
# Measure Preformance
# zmodload zsh/zprof

# ZGEN_AUTOLOAD_COMPINIT=false
ZSH_DISABLE_COMPFIX=true

# # NOTE: on oh-my-zsh when you add new plugin on your configuration. You need to remove .zcompdump* on your home directory.
# # Load completions
# Enable autocompletions
autoload -Uz compinit
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi


# completion style
zstyle ':completion:*' menu select

# turn of bell
unsetopt BEEP

# auto easy direction navigation
setopt autocd autopushd pushdignoredups

# history
export HISTFILE="${HOME}/.zsh_history"
export HISTSIZE=2000000
export SAVEHIST=2000000

# Antibody
# Set antibody home
export ANTIBODY_HOME=~/.antibody
# load antibody with static method
if [ ! -f "${HOME}/.zsh_plugins.sh" ]; then
  antibody bundle < "${HOME}/.zsh_plugins.txt" > "${HOME}/.zsh_plugins.sh"
  source "${HOME}/.zsh_plugins.sh"
else
  source "${HOME}/.zsh_plugins.sh"
fi

# Set Color for autocolor-ls
export CLICOLOR=1

# Set history search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Language tools setup
# Golang
export GOPATH="$HOME/go"; export GOROOT="$HOME/.go"; export PATH="$GOPATH/bin:$PATH"; # g-install: do NOT edit, see https://github.com/stefanmaric/g
alias gvm=$GOPATH/bin/g

# python maybe?
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Node 
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Ruby
export RUBY_CONFIGURE_OPTS="--with-readline-dir=$(brew --prefix readline) --with-openssl-dir=$(brew --prefix openssl@1.1)"
eval "$(rbenv init -)"

# JAVA, Maven, etc
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="${HOME}/.sdkman"
[[ -s "${HOME}/.sdkman/bin/sdkman-init.sh" ]] && source "${HOME}/.sdkman/bin/sdkman-init.sh"

# Setpath
export GRAILS_HOME="$HOME/.sdkman/candidates/grails/current"
export GRADLE_HOME="$HOME/.sdkman/candidates/gradle/current"
export PATH="$GRAILS_HOME/bin:$PATH"
export PATH="$GRADLE_HOME/bin:$PATH"
export PATH="${PATH}:${HOME}/bin:${GOPATH}/bin"
export PATH="/usr/local/sbin:$PATH"

# Aliases
# docker
alias dk='docker'
alias dc='docker-compose'

# reload zsh
alias upz='rm ~/.zcompdump* && source ~/.zshrc'
alias rez='source ~/.zshrc'

# alias ssh
alias ssh='TERM=xterm-256color ssh'

# fix alias not found on watch
alias watch='watch '

# alias antibody
alias abtu="antibody update -p 12 && antibody bundle < ${HOME}/.zsh_plugins.txt > ${HOME}/.zsh_plugins.sh"
alias abtg="antibody bundle < ${HOME}/.zsh_plugins.txt > ${HOME}/.zsh_plugins.sh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ${HOME}/.p10k.zsh ]] || source ${HOME}/.p10k.zsh

# begin appcenter completion
. <(appcenter --completion)
# end appcenter completion
