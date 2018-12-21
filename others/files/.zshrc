# -------------------------------------
# gitの設定
# -------------------------------------
alias ga='git add -A'
alias gc='git commit -m'
alias gs='git status'
alias gl="~/bin/git-foresta --all --style=10 | less -RSX"
alias push='git push'
alias pull='git pull'

# -------------------------------------
# pyenv
# -------------------------------------
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# -------------------------------------
# prompt
# -------------------------------------
setopt transient_rprompt # 右側まで入力がきたら時間表示を消す
setopt prompt_subst # 変数展開など便利なプロント
bindkey -e # emacsライクなキーバインド
bindkey -v # viライクなキーバインド
export LANG=ja_JP.UTF-8 # 日本語環境
export EDITOR=vim # エディタはvi

# -------------------------------------
# 補完
# -------------------------------------
autoload -U compinit # 補完機能
compinit -u # 補完を賢くする
setopt autopushd # cdの履歴表示、cd - で一つ前のディレクトリへ
setopt pushd_ignore_dups # 同ディレクトリを履歴に追加しない
setopt auto_cd # ディレクトリ名のみでcd
setopt list_packed # リストを詰めて表示
setopt list_types # 補完一覧をファイル種別に表示
setopt correct # コマンドのスペルチェックを有効に


# -------------------------------------
# 履歴
# -------------------------------------
HISTFILE=~/.shell_history # historyファイル
HISTFILESIZE=1000000
HISTSIZE=1000000 # ファイルサイズ
SAVEHIST=1000000 # saveする量
setopt hist_ignore_dups # 重複を記録しない
setopt hist_reduce_blanks # スペース排除
setopt share_history # 履歴ファイルを共有
setopt EXTENDED_HISTORY # zshの開始終了を記録

alias ls="ls -lahG"

autoload -Uz colors
autoload -Uz vcs_info
colors
precmd () { vcs_info }
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
PROMPT='${fg[green]}%n${reset_color} : %{${fg[yellow]}%}%~%{${reset_color}%}${vcs_info_msg_0_}
%(?.%B%F{green}.%B%F{blue})%(?!▶ !▷ )%f%b'
RPROMPT=''


# -------------------------------------
# History検索にpecoの導入
# -------------------------------------
function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection
