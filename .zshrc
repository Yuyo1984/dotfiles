# Lines configured by zsh-newuser-install
export EDITOR=vim #エディタをvimに設定
export LANG=ja_JP.UTF-8 #文字コードをUTF-8に設定
export MAILCHECK=0 #警告を出さなくさせる

typeset -U path PATH
path=(
  /usr/local/bin
  /usr/local/sbin
  /opt/homebrew/bin(N-/)
  /opt/homebrew/sbin(N-/)
  /usr/bin
  /usr/sbin
  /bin
  /sbin
  /Library/Apple/usr/bin
)

# プロンプト設定
PROMPT="%F{036}%B%~%b%f 
%% "


# プロンプトの右側(RPROMPT)にメソッドの結果を表示させる
RPROMPT='`rprompt-git-current-branch`'

# history
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt extended_history #ヒストリに実行時間も保存
setopt hist_ignore_dups #直前と同じコマンドはヒストリに追加しない

#vi ライクな操作ができる
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall

autoload -U zcalc
autoload zed

autoload -Uz compinit
compinit

#
# setopt
#

# cdの省略
setopt auto_cd

# cdした先のディレクトリをディレクトリスタックに追加
setopt auto_pushd

# pushdしたとき、ディレクトリがすでにスタックに含まれていればスタックに追加しない
setopt pushd_ignore_dups

# コマンドのスペルを訂正する
setopt correct

# <Tab>でパス名の補完候補を表示したあと、
# 続けて<Tab>を押すと候補からパス名を選択することができるようになる
zstyle ':completion:*:default' menu select=1

autoload colors
zstyle ':completion:*' list-colors "${LS_COLORS}"


#エイリアス
alias ls="lsd"
alias la='ls -aG'
alias ll='ls -lG'
alias vi='nvim'
alias vz='vim ~/dotfiles/.zshrc'
alias archive='cd ~/programming/procon-archive'
alias vim='/usr/local/bin/vim'
alias pabc='cd ~/atcoder-python/abc'
alias mkCompro='source AtCoder/bin/activate'
alias cw='nvim main.py'
alias tp='oj t -c "python3 main.py" -d ./test'
alias sp='acc s main.py -- -l 5055 -w 0 -y --no-open'
alias spp='acc s main.py -- --guess-python-interpreter pypy -w 0 -y --no-open'
alias sc='~/atcoder-python/tools/new.zsh'
alias sw='acss watch'
alias debug='python3 -m pdb main.py'
alias cb='cd ~/ac-problems-contest-builder'
alias cn="cargo new --bin"
alias cr="cargo run"
alias cb="cargo build"
alias cdcp="bat main.py | pbcopy"
# マークダウンファイルを見るコマンド
function mdview() {
    markdown $1 | lynx -stdin
}

# cdの後にlsを実行
# chpwd() { ls -ltrG  }

# 補完候補のメニュー選択で、矢印キーの代わりにhjklで移動出来るようにする。
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char


# End of lines added by compinstall

# export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init - zsh)"

# コマンドの実行ごとに改行
function precmd() {
  # Print a newline before the prompt, unless it's the
  # first prompt in the process.
  if [ -z "$NEW_LINE_BEFORE_PROMPT" ]; then
      NEW_LINE_BEFORE_PROMPT=1
  elif [ "$NEW_LINE_BEFORE_PROMPT" -eq 1 ]; then
      echo ""
  fi
}

# ブランチ名を状態アイコンと一緒に表示させるメソッド
function rprompt-git-current-branch {
    local branch_name st branch_status

    if [ ! -e  ".git" ]; then
      # gitで管理されていないディレクトリは何も返さない
      return
    fi
    branch_name=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
    st=`git status 2> /dev/null`
    if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
      # 全てcommitされてクリーンな状態
      branch_status="%F{green}"
    elif [[ -n `echo "$st" | grep "^Untracked files"` ]]; then
      # gitに管理されていないファイルがある状態
      branch_status="%F{red}?"
    elif [[ -n `echo "$st" | grep "^Changes not staged for commit"` ]]; then
      # git addされていないファイルがある状態
      branch_status="%F{red}+"
    elif [[ -n `echo "$st" | grep "^Changes to be committed"` ]]; then
    # git commitされていないファイルがある状態
      branch_status="%F{yellow}!"
    elif [[ -n `echo "$st" | grep "^rebase in progress"` ]]; then
      # コンフリクトが起こった状態
      echo "%F{red}!(no branch)"
      return
    else
      # 上記以外の状態の場合は青色で表示させる
      branch_status="%F{blue}"
    fi
    # ブランチ名を色付きで表示する
    echo "${branch_status}[$branch_name]"
}

# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst

#pyenvのPath設定
#export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/shims:$PATH"
#eval "$(pyenv init -)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/Users/yuyoyanase/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/Users/yuyoyanase/anaconda3/etc/profile.d/conda.sh" ]; then
#        . "/Users/yuyoyanase/anaconda3/etc/profile.d/conda.sh"
#    else
#        export PATH="/Users/yuyoyanase/anaconda3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
# <<< conda initialize <<<

# Go
# export GOPATH=$HOME/programming/go
# export PATH=$PATH:$GOPATH/bin

# tmuxを開始時に起動する
# if [[ ! -n $TMUX && $- == *l* ]]; then
  # get the IDs
  # ID="`tmux list-sessions`"
  #if [[ -z "$ID" ]]; then 
    #tmux new-session
  #fi
  #create_new_session="Create New Session"
  #ID="$ID\n${create_new_session}:"
  #ID="`echo $ID | peco | cut -d: -f1`"
  #if [[ "$ID" = "${create_new_session}" ]]; then
    #tmux new-session
  #elif [[ -n "$ID" ]]; then
    #tmux attach-session -t "$ID"
  #else
    #: # Start terminal normally
  #fi
#fi

#ターミナルを256色表示に対応させる
export TERM=xterm-256color

export DOCKER_HOST=unix:///var/run/docker.sock
#export DOCKER_HOST=unix://$HOME/.lima/docker/sock/docker.sock

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# コマンド履歴検索Pecoの設定
# function peco-history-selection() {
#    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
#    CURSOR=$#BUFFER
#    zle reset-prompt
#}

# zle -N peco-history-selection
# bindkey '^R' peco-history-selection

# [ -f "/Users/yuyoyanase/.ghcup/env" ] && source "/Users/yuyoyanase/.ghcup/env" # ghcup-env

# ghの補完
# eval "$(gh completion -s zsh)"

# zの設定
# . `brew --prefix`/etc/profile.d/z.sh

# 起動したらRustのパスを通す
# source "$HOME/.cargo/env"

export PATH="/usr/local/bin:$PATH"
#export PATH="/opt/homebrew/bin:/usr/local/bin:/Library/Tex/texbin:$PATH"
#export PATH="/System/Volumes/Data/Users/user1/Library/Python/3.12/bin:$PATH"
#export PATH="/Users/user1/Library/Python/3.12/bin:$PATH"
export PATH="$(brew --prefix python)/libexec/bin:$PATH"

# 入った時にanyenvをリロード
eval "$(anyenv init -)"
export PATH="$HOME/.anyenv/bin:$PATH"

source /Users/user1/atcoder-python/AtCoder/bin/activate
. "$HOME/.cargo/env"

export PATH="$HOME/.gem/ruby/3.2.0/bin:$PATH"

