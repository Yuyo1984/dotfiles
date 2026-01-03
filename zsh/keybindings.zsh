# ============================================
# キーバインド設定
# ============================================

# viライクな操作を有効化
bindkey -v

# 補完候補のメニュー選択で、矢印キーの代わりにhjklで移動
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

# Pecoによるコマンド履歴検索
function peco-history-selection() {
   BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
   CURSOR=$#BUFFER
   zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection
