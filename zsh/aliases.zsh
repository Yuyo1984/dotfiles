# ============================================
# エイリアス設定
# ============================================

# --- 基本コマンド ---
alias ls="lsd"
alias la='ls -aG'
alias ll='ls -lG'
alias an='nvim'
alias md='glow -p -'
alias j='z'

# --- 設定ファイル編集 ---
alias vz='nvim ~/dotfiles/.zshrc'

# --- 競技プログラミング ---
# ディレクトリ移動
alias pabc='cd ~/Compro/abc'
alias makecon='cd ~/ac-problems-contest-builder'

# 環境構築
alias mkCompro='source ~/Compro/atc-venv/bin/activate'

# ファイル作成・編集
alias wcpy='nvim main.py'
alias wcrb='nvim main.rb'
alias wcpp='nvim main.cpp'

# コンパイル
alias mcpp='g++ -o main main.cpp'

# テスト実行
alias tsrb='oj t -c "ruby main.rb" -d ./test' 
alias tspy='oj t -c "python3 main.py" -d ./test'

# 提出
alias sbrb='acc s main.rb -- -l 5018 -w 0 -y --no-open'
alias sbpy='acc s main.py -- -l 5055 -w 0 -y --no-open'
alias sbpp='acc s main.py -- --guess-python-interpreter pypy -w 0 -y --no-open'
alias sbwt='acss watch'

# コンテスト開始
alias stcon='~/Compro/tools/new.zsh'

# デバッグ
alias debug='python3 -m pdb main.py'

# ライブラリ取得
alias getlib='cp -r ~/Compro/ac-library/atcoder .'

# --- Cargo (Rust) ---
alias cn="cargo new --bin"
alias cr="cargo run"
alias cb="cargo build"

# --- ユーティリティ ---
alias cdcp="bat main.py | pbcopy"
alias teee='tee >(pbcopy)'
alias jsl='osascript -l JavaScript'
