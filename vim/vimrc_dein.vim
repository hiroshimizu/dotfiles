
"dein Scripts-----------------------------
if &compatible
	  set nocompatible               " Be iMproved
endif

let s:dein_path = expand('~/.cache/dein')
let s:dein_repo_path = s:dein_path . 'repos/github.com/Shougo/dein.vim'

"dein.vim がなければgithubからclone
if &runtimepath !~# '/dein.vim'
	if !isdirectory(s:dein_repo_path)
		execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_path
	endif
	execute 'set runtimepath^=' . fnamemodify(s:dein_repo_path, ':p')
endif


""" Required:
""set runtimepath+=/mnt/c/linux_home/.cache/dein/repos/github.com/Shougo/dein.vim
""
""" Required:
if dein#load_state(s:dein_path)
  call dein#begin('s:dein_path')

  let g:config_dir = expand('~/.cache/dein/userconfig')
  let s:toml        = g:config_dir . '/plugins.toml'
  let s:lazy_toml  = g:config_dir . '/plugins_lazy.toml'

  "toml読み込み
	call dein#load_toml(s:toml,      {'lazy': 0})
	call dein#load_toml(s:lazy_toml, {'lazy': 1})


""  " Let dein manage dein
""  " Required:
""  call  dein#add('/mnt/c/linux_home/.cache/dein/repos/github.com/Shougo/dein.vim')
""
""  " Add or remove your plugins here like this:
""  "call dein#add('Shougo/neosnippet.vim')
""  "call dein#add('Shougo/neosnippet-snippets')
""
""""	call dein#add('Shougo/deoplete.nvim')
""""	if !has('nvim')
""""	  call dein#add('roxma/nvim-yarp')
""""	    call dein#add('roxma/vim-hug-neovim-rpc')
""""	 endif
""""	 let g:deoplete#enable_at_startup = 1
""
""  call dein#add('Shougo/neosnippet.vim')
""  call dein#add('Shougo/neosnippet-snippets')
""""  call dein#add('vim-scripts/Shougo/unite.vim')
""""	call dein#add('vim-scripts/Shougo/neomru.vim')
""""	"call dein#add('Shougo/neocomplcache.vim')
""""	call dein#add('vim-scripts/Shougo/neocomplete.vim')
""""	call dein#add('vim-scripts/Shougo/neoyank.vim')
""""	call dein#add('thinca/vim-quickrun')
""""
""""	call dein#add('vim-scripts/osyo-manga/shabadou.vim')
""""	call dein#add('osyo-manga/unite-quickfix')
""""	call dein#add('easymotion/vim-easymotion')
""""	call dein#add('nathanaelkane/vim-indent-guides')
""""	call dein#add('vim-airline/vim-airline')
""""	call dein#add('vim-scripts/nanotech/jellybeans.vim')
""""	call dein#add('vim-scripts/mattn/emmet-vim')
""""	"call dein#add('taichouchou2/surround.vim')
""""	call dein#add('vim-scripts/open-browser.vim')
""""	call dein#add('vim-scripts/mattn/webapi-vim')
""""	call dein#add('hail2u/vim-css3-syntax')
""""	"call dein#add('taichouchou2/html5.vim')
""""	"call dein#add('taichouchou2/vim-javascript')
""""	call dein#add('kchmck/vim-coffee-script')
""
  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

"""################################################################################
""" プラグインマネージャの"dein"のための記述
""" プラグインの情報はTOMLファイルなるものに書くとよいらしい
""" ~/.vim/dein/ 以下にTOMLファイルを用意することにする
""" git が必要
""" **現状，call dein#update()を実行するとエラーがでるため，使用を中止**
"""
""" deinの置く場所
""let s:dein_dir = expand('~/.vim/dein')
""" deinのリポジトリがある場所?
""let s:dein_repo_dir = s:dein_dir . '/.vim/dein/repos/github.com/Shougo/dein.vim'
""
""if &compatible
""	set nocompatible
""endif
""
""" dein.vimがない場合自動インストール
"""if !isdirectory(s:dein_repo_dir)
"""	echo "installing dein.vim ..."
"""	execute 'git clone git@github.com:Shougo/dein.vim.git' s:dein_repo_dir
"""endif
"""
""" pathの設定?
"""execute 'set runtimepath^=' . s:dein_repo_dir
""set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim
""
"""--------------------------------------------------------------------------------
"""Start dein.vim Settings.
"""--------------------------------------------------------------------------------
"""if dein#load_state(s:dein_dir)
"""	call dein#begin(s:dein_dir)
""
"""	let s:toml = s:dein_dir . '/.dein.toml'
"""	let s:lazy_toml = s:dein_dir . '/.dein_lazy.toml'
"""	call dein#load_toml(s:toml, {'lazy': 0})
"""	call dein#load_toml(s:lazy_toml, {'lazy': 1})
"""
""	call dein#add('Shougo/dein.vim')
""	call dein#add('Shougo/vimproc.vim', {'build': 'make'})
""
""	call dein#add('Shougo/neocomplete.vim')
""	call dein#add('Shougo/neomru.vim')
""	call dein#add('Shougo/neosnippet')
""	call dein#add('Shougo/neosnippet-snippets')
""
""
""	call dein#end()
"""	call dein#save_state()
"""endif
""" プラグインの追加，削除tomlファイルの設定を変更した場合は
""" 適宜，call dein#updateやcall dein#clear_stateが必要らしい
""
"""if dein#check_install()
"""	call dein#install()
"""endif
""
""filetype plugin indent on
""
""" pluginのための設定
"""nmap <C-q><C-q> :<C-u>QuickRun -args("")<LEFT><LEFT>
""map \R :<C-u>QuickRun -args<SPACE>
""" 上のマップは端末によっては聞かないことがあるらしい
""
"""let g:quickrun_config = get(g:, 'quickrun_config', {})
"""let g:quickrun_config._ = {
"""      \ 'runner'    : 'vimproc',
"""      \ 'runner/vimproc/updatetime' : 60,
"""      \ 'outputter' : 'error',
"""      \ 'outputter/error/success' : 'buffer',
"""      \ 'outputter/error/error'   : 'quickfix',
"""      \ 'outputter/buffer/split'  : ':rightbelow 8sp',
"""      \ 'outputter/buffer/close_on_empty' : 1,
"""      \ }
""
""
"""################################################################################
""
""
