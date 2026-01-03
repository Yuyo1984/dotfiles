# ============================================
# プラグイン設定 (Zinit)
# ============================================

### Zinitのインストーラー
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

# Pureテーマの読み込み
zinit ice pick"async.zsh" src"pure.zsh"
zinit light sindresorhus/pure

# Spaceship prompt（コメントアウト、必要に応じて有効化）
# zinit light spaceship-prompt/spaceship-prompt

# Zinit annexesの読み込み
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

# プラグインの読み込み
zinit light zsh-users/zsh-syntax-highlighting
# zinit light zsh-users/zsh-autosuggestions  # 必要に応じて有効化
zinit light zsh-users/zsh-completions
zinit light zdharma/history-search-multi-word
