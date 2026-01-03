# ============================================
# 環境変数設定
# ============================================

# エディタをneovimに設定
export EDITOR=nvim

# 文字コードをUTF-8に設定
export LANG=ja_JP.UTF-8

# メールチェックの警告を出さない
export MAILCHECK=0

# ターミナルを256色表示に対応
export TERM=xterm-256color

# Docker設定
export DOCKER_HOST=unix:///var/run/docker.sock

# Go言語の設定
export GOPATH="$HOME/go"

# Rust環境
source "$HOME/.cargo/env" 2>/dev/null

# nvm設定
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
