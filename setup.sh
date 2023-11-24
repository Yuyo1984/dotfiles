 #!/bin/zsh

  DOT_FILES=(.gem .gemrc .git .gitconfig \
 .procon-gardener .pyenv .rbenv .zprofile .zsh_sessions \
 .zshrc .vimrc .tmux.conf)

 for file in ${DOT_FILES[@]}
 do
     ln -s $HOME/tools/dotfiles/$file $HOME/$file
 done
