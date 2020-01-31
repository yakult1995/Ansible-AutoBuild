#--------------------------------------
# vim
#--------------------------------------
alias vim='/usr/local/bin/vim'
alias n='v'

# -------------------------------------
# docker alias
# -------------------------------------
alias d='docker-shell'
alias dcud='docker-compose up -d'
alias dcu='docker-compose up'
alias dcd='docker-compose down'
alias dcb='docker-compose build'
alias dcl='docker-compose logs -f'
alias docker-stopped-container-delete='docker rm $(docker ps -a -q)'
alias docker-none-tag-images-delete='docker rmi $(docker images -f "dangling=true" -q)'

# -------------------------------------
# gitの設定
# -------------------------------------
alias ga='git add -A'
alias gc='git commit'
alias gf='git diff'
alias gs='git status'
alias gl="~/bin/git-foresta --all --style=10 | less -RSX"
alias gcb="git checkout -b"
alias gco="git branch | peco | xargs -IBRANCH_NAME git checkout BRANCH_NAME"
alias push='git push -u origin `git rev-parse --abbrev-ref HEAD`'
alias pull='git pull origin `git rev-parse --abbrev-ref HEAD`'
alias git-branch-list="git branch | peco C"

#--------------------------------------
# etc.
# -------------------------------------
alias c='clear'
alias -g G='| grep --color=auto'
alias tree='tree -CfhL '
alias zconfig='vim ~/.zshrc'
alias reload='exec $SHELL -l'
alias k="k -ah"
alias l="k"
alias cat="ccat"
alias t="tmux"
alias e="exit"
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias -g L='| less'
alias -g G='| grep'

#--------------------------------------
# k8s
#--------------------------------------
alias ku='kubectl'
alias eks='eksctl'
alias p='ku get po -A -o wide'
alias -g P='$(ku get po | peco | awk "{print \$1}")'
#alias dp="k describe po `k get po -A | peco | awk "{print '-n', \$1, 'po', \$2}"`"
alias descn='ku describe no $(k get no -A | peco | awk "{print \$2}")'
#alias -g P='$(k get po -A | peco | awk "{print \$2}")'
alias h='helm'
alias hf='helmfile'

# -------------------------------------
# vagrant alias
# -------------------------------------
alias v='vagrant'
alias vu='vagrant up'
alias vh='vagrant halt'
alias vd='vagrant destroy'
alias vs='vagrant ssh'
