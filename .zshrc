# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"

# zsh設定ディレクトリ
ZDOTDIR="${HOME}/dotfiles/zsh"

# 各設定ファイルを読み込み
if [[ -d "$ZDOTDIR" ]]; then
  for config_file in "$ZDOTDIR"/*.zsh; do
    source "$config_file"
  done
fi

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"
