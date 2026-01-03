# ============================================
# PATH設定
# ============================================

# PATHの重複を防ぐ
typeset -U path PATH

# 基本的なPATH
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

# Python PATH
export PATH="$(brew --prefix python)/libexec/bin:$PATH"

# anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)" 2>/dev/null

# Rust (Cargo)
export PATH="$HOME/.cargo/bin:$PATH"

# Go言語
# export PATH="$GOPATH/bin:$PATH"

# 競技プログラミング用ツール
export PATH="$HOME/cf_v1.0.0_darwin_64:$PATH"

# TeX Live
export PATH=$PATH:/usr/local/texlive/2024/bin/universal-darwin

# unzip
export PATH="/usr/local/opt/unzip/bin:$PATH"

# ローカルbin
export PATH="$HOME/local/bin:$PATH"
