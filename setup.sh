 #!/bin/zsh

  DOT_FILES=(.gitconfig \
 .zprofile .zsh_sessions \
 .zshrc .vimrc .tmux.conf)

 for file in ${DOT_FILES[@]}
 do
     ln -s $HOME/tools/dotfiles/$file $HOME/$file
 done
