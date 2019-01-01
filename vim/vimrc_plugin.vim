
""" vimrc plugin

" プラグイン関係をここに記述する

"################################################################################
" deinによるプラグイン管理
" neobundleのニューバージョン的存在らしい
" 現在エラーが発生するためneobundleで同じことをやっている
":source ~/.vim/vimrc_dein.vim
"
"################################################################################
" neobunbleによるプラグイン管理

if has('vim_starting')
	set nocompatible
	" neobundleがない場合gitコマンドを用いてインストールする
	if !isdirectory(expand("~/dotfiles/vim/bundle/neobundle.vim/"))
		:call system("git clone git://github.com/Shougo/neobundle.vim ~/dotfiles/vim/bundle/neobundle.vim")
	endif
   set runtimepath+=~/dotfiles/vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/dotfiles/vim/bundle'))
let g:neobundle_default_git_protocol='https'
NeoBundleFetch 'Shougo/neobundle.vim'
" 以下にインストールしたいプラグインを列挙していけばよい

NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \     'windows' : 'make -f make_mingw32.mak',
  \     'cygwin' : 'make -f make_cygwin.mak',
  \     'mac' : 'make -f make_mac.mak',
  \     'unix' : 'make -f make_unix.mak',
  \    },
  \ }
NeoBundle "Shougo/unite.vim"
NeoBundle "Shougo/neomru.vim"
NeoBundle "Shougo/neosnippet.vim"
NeoBundle "Shougo/neosnippet-snippets"
NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle "Shougo/neoyank.vim"
""NeoBundleLazy 'thinca/vim-quickrun', {
""  \ 'autoload' : {
""  \   'mappings' : [['n', '\r']],
""  \   'commands' : ['QuickRun']
""  \ }}
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'osyo-manga/shabadou.vim'
NeoBundle "osyo-manga/unite-quickfix"
"
NeoBundle "easymotion/vim-easymotion"
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'open-browser.vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'hail2u/vim-css3-syntax'
"NeoBundle 'othree/html5.vim'
"NeoBundle 'taichouchou2/vim-javascript'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'scrooloose/nerdtree'

"
"################################################################################
" プラグインの列挙はここまで
"################################################################################

NeoBundleCheck
call neobundle#end()
filetype plugin indent on
syntax on


"################################################################################
" プラグインの設定
"################################################################################

source ~/dotfiles/vim/vimrc_plugin_config_neocomplcache.vim
source ~/dotfiles/vim/vimrc_plugin_config_neosnippet.vim
source ~/dotfiles/vim/vimrc_plugin_config_unite.vim
source ~/dotfiles/vim/vimrc_plugin_config_quickrun.vim
"
"" ~~~.texファイルをlatexのファイルと認識する?
"let g:tex_flavor='latex'


"" vim-indent-guides {{{
" CUIではあまり美しくないように見えるので使うのを止める
" -> t_Co = 256とするとちょっといい感じになったのでやっぱり使ってみる
" -> やっぱりうざい。使用を止める。
" Vim起動時にvim-indent-guidesも起動する/しない=1/0
let g:indent_guides_enable_on_vim_startup=0
" ガイドするレベル
let g:indent_guides_start_level=2
" 自動での色付けを停止，奇数列と偶数列で色をかえるため
let g:indent_guides_auto_colors=0
" 奇数列の色
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#444433 ctermbg=darkgray
" 偶数列の色
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#333344 ctermbg=blue
" ターミナルの背景とかで見栄えの良さが変わるので
" :so $VIMRUNTIME/syntax/colortest.vim を参考にして設定すると良いかも
" ハイライトする色の変化の幅
let g:indent_guides_color_change_percent = 30
" 色付けする文字数
let g:indent_guides_guide_size = 3
"}}}
"
" vim-airlineの設定 {{{
" タブラインにもairlineを使用する
let g:airline#extensions#tabline#enabled = 1
" タブが一個の場合はタブラインを非表示
let g:airline#extensions#tabline#show_buffers = 0
" 0でそのタブで開いているウィンドウの数，1でそのタブの番号?左から連番
let g:airline#extensions#tabline#tab_nr_type = 1
" }}}
"Uniteの設定 {{{
"history/yankを有効化＆ノーマルモードで,uyでhistroy/yank
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>



"html5 syntax
let g:html5_event_handler_attributes_complete = 0
let g:html5_rdfa_attributes_complete = 0
let g:html5_microdata_attributes_complete = 0
let g:html5_aria_attributes_complete = 0

