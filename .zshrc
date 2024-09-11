# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
export EDITOR=nvim #エディタをnvimに設定
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
#PROMPT="%F{036}%B%~%b%f 
# %% "


# プロンプトの右側(RPROMPT)にメソッドの結果を表示させる
# RPROMPT='`rprompt-git-current-branch`'

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
alias vz='vi ~/dotfiles/.zshrc'
alias archive='cd ~/programming/procon-archive'
alias vim='/usr/local/bin/vim'
alias pabc='cd ~/atcoder-python/abc'
alias mkCompro='source ~/Compro/atc-venv/bin/activate'
alias cw='~/atcoder-python/tools/create_python_template.sh main.py & nvim main.py'
alias tp='oj t -c "python3 main.py" -d ./test'
alias sp='acc s main.py -- -l 5055 -w 0 -y --no-open'
alias spp='acc s main.py -- --guess-python-interpreter pypy -w 0 -y --no-open'
alias sc='~/Compro/tools/new.zsh'
alias sw='acss watch'
alias debug='python3 -m pdb main.py'
alias cb='cd ~/ac-problems-contest-builder'
alias cn="cargo new --bin"
alias cr="cargo run"
alias cb="cargo build"
alias cdcp="bat main.py | pbcopy"
alias getlib='cp -r ~/Compro/ac-library/atcoder .'
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

# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst

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

# ghの補完
eval "$(gh completion -s zsh)"

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

. "$HOME/.cargo/env"

export PATH="$HOME/.gem/ruby/3.2.0/bin:$PATH"
export GOPATH="$HOME/go"
# export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/cf_v1.0.0_darwin_64:$PATH"

export PATH="/usr/local/bin:$PATH"


### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load the pure theme, with zsh-async library that's bundled with it.
#zinit ice pick"async.zsh" src"pure.zsh"
#zinit light sindresorhus/pure
zinit light romkatv/powerlevel10k

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zdharma/history-search-multi-word
### End of Zinit's installer chunk

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
