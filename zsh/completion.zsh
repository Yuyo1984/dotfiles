# ============================================
# 補完設定
# ============================================

# 補完機能を有効化
autoload -Uz compinit
compinit

# 計算機能
autoload -U zcalc

# zedエディタ
autoload zed

# <Tab>でパス名の補完候補を表示したあと、
# 続けて<Tab>を押すと候補からパス名を選択できる
zstyle ':completion:*:default' menu select=1

# 補完候補に色を付ける
autoload colors
zstyle ':completion:*' list-colors "${LS_COLORS}"

# ghコマンドの補完
eval "$(gh completion -s zsh)" 2>/dev/null
