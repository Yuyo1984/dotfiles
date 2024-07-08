" 日本語有効化
set encoding=utf-8
scriptencoding utf-8

" Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'cocopon/iceberg.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'thinca/vim-quickrun'
Plugin 'ivanov/vim-ipython'
Plugin 'guns/xterm-color-table.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'scrooloose/syntastic'
Plugin 'pmsorhaindo/syntastic-local-eslint.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'suy/vim-ctrlp-commandline'
Plugin 'rking/ag.vim'
Plugin 'ervandew/supertab'
Plugin 'cohama/lexima.vim'
Plugin 'preservim/nerdtree'
Plugin 'Shougo/neocomplcache'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'vim-jp/vimdoc-ja'
Plugin 'brglng/vim-im-select'
Plugin 'mattn/emmet-vim'
Plugin 'https://github.com/twitvim/twitvim.git'

" The following are examples of different formats supported.
" （ここは入力例なので略）

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"----------------------------------------
" 基本設定
"----------------------------------------
" ファイルを上書きする前にバックアップを作ることを無効化
set nowritebackup
" ファイルを上書きする前にバックアップを作ることを無効化
set nobackup
" vim の矩形選択で文字が無くても右へ進める
set virtualedit=block
" 挿入モードでバックスペースで削除できるようにする
set backspace=indent,eol,start
" 全角文字専用の設定
set ambiwidth=double
" wildmenuオプションを有効(vimバーからファイルを選択できる)
set wildmenu

" 挿入モード解除キーの変更
inoremap <C-c> <ESC>

"----------------------------------------
" 検索
"----------------------------------------
" 検索するときに大文字小文字を区別しない
set ignorecase
" 小文字で検索すると大文字と小文字を無視して検索
set smartcase
" 検索がファイル末尾まで進んだら、ファイル先頭から再び検索
set wrapscan
" インクリメンタル検索 (検索ワードの最初の文字を入力した時点で検索が開始)
set incsearch
" 検索結果をハイライト表示
set hlsearch

"----------------------------------------
" 表示設定
"----------------------------------------
" エラーメッセージの表示時にビープを鳴らさない
set noerrorbells
" Windowsでパスの区切り文字をスラッシュで扱う
set shellslash
" 対応する括弧やブレースを表示
set showmatch matchtime=1
" インデント方法の変更
set cinoptions+=:0
" メッセージ表示欄を2行確保
set cmdheight=2
" ステータス行を常に表示
set laststatus=2
" ウィンドウの右下にまだ実行していない入力中のコマンドを表示
set showcmd
" 省略されずに表示
set display=lastline
" タブ文字を CTRL-I で表示し、行末に $ で表示する
set list
" 行末のスペースを可視化
set listchars=tab:^\ ,trail:~
" コマンドラインの履歴を10000件保存する
set history=10000
" 入力モードでTabキー押下時に半角スペースを挿入
set expandtab
" インデント幅
set shiftwidth=4
" タブキー押下時に挿入される文字幅を指定
set softtabstop=4
" ファイル内にあるタブ文字の表示幅
set tabstop=4
" ツールバーを非表示にする
set guioptions-=T
" yでコピーした時にクリップボードに入る
set guioptions+=a
" メニューバーを非表示にする
set guioptions-=m
" 右スクロールバーを非表示
set guioptions+=R
" 対応する括弧を強調表示
set showmatch
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" スワップファイルを作成しない
set noswapfile
" 検索にマッチした行以外を折りたたむ(フォールドする)機能
set nofoldenable
" タイトルを表示
set title
" 行番号の表示
set number
" ヤンクでクリップボードにコピー
set clipboard=unnamed,autoselect
" Escの2回押しでハイライト消去
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>
" シンタックスハイライト
syntax on
" すべての数を10進数として扱う
set nrformats=
" 行をまたいで移動
set whichwrap=b,s,h,l,<,>,[,],~
" バッファスクロール
set mouse=a
" ルーラーを表示
set ruler
"---------------------------------------

" auto reload .vimrc
augroup source-vimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
  autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END

" auto comment off
augroup auto_comment_off
  autocmd!
  autocmd BufEnter * setlocal formatoptions-=r
  autocmd BufEnter * setlocal formatoptions-=o
augroup END

" HTML/XML閉じタグ自動補完
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

" 編集箇所のカーソルを記憶
if has("autocmd")
  augroup redhat
    " In text files, always limit the width of text to 78 characters
    autocmd BufRead *.txt set tw=78
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ end
  augroup END
endif

"----------------------------------------
" カラースキーム
set background=dark
colorscheme iceberg

" ステータスラインの設定
set showmode " 現在のモードを表示
set showcmd " 打ったコマンドをステータスラインの下に表示

" 色表示を256色に対応させる
if !has('gui_running')
  set t_Co=256
endif

" Lightlineの設定
let g:lightline = {
    \ 'colorscheme': 'wombat'
    \ }

" jedi-vimの設定
let g:jedi#auto_vim_configuration = 0
" let g:jedi#show_function_definition = 0
let g:jedi#show_call_signatures = 0
let g:jedi#completions_command = "<C-N>"

if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.python = 'hw*|[^.t].w*'
" ポップアップを表示しない
autocmd FileType python setlocal completeopt-=preview


" vim-quickrunの設定
nnoremap <F11> :QuickRun<CR>

let g:quickrun_config = {}

let g:quickrun_config._ = {
  \ 'outputter/error/success': 'buffer',
  \ 'outputter/error/error': 'quickfix',
  \ 'outputter/quickfix/open_cmd': 'copen',
  \ 'runner': 'vimproc',
  \ 'runner/vimproc/updatetime': 60,
  \ 'hook/time/enable': 1
  \ }



" for python
let g:quickrun_config.python = {
  \ 'command': '~/.pyenv/shims/python',
  \ 'cmdopt': '-u'
  \ }

nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

" neosnippetの設定
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" set snippet file dir
let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/snippets/,~/.vim/snippets'

" set of vim-help
set helplang=ja,en

" insert抜けた時にIMEオフ
" autocmd InsertLeave * :silent !/usr/local/bin/im-select

" NERDtree
let NERDTreeWinSize = 20
nnoremap <silent><C-e> :NERDTreeToggle<CR>
