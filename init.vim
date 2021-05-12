"<Leader>r  Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'kien/ctrlp.vim'
Plug 'flazz/vim-colorschemes'
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-unimpaired'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'tpope/vim-rails'
Plug 'scrooloose/syntastic'
"Plug 'powerline/powerline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'majutsushi/tagbar'
Plug 'luochen1990/rainbow'
"Plug 'tpope/vim-surround'
Plug 'Lokaltog/vim-easymotion'
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-sneak'
"Plug 'Raimondi/delimitMate'
Plug 'valloric/MatchTagAlways'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-endwise'
Plug 'fatih/vim-go'
Plug 'outsmartin/haproxy.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'mbbill/undotree'
Plug 'rking/ag.vim'
Plug 'groenewege/vim-less'
Plug 'elixir-lang/vim-elixir'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-repeat'
Plug 'plasticboy/vim-markdown'
"Plug 'AlessandroYorba/Sierra'
Plug 'ngmy/vim-rubocop'
Plug 'posva/vim-vue'
Plug 'mhinz/vim-mix-format'
"Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'}
Plug 'tpope/vim-rhubarb'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'sonph/onehalf', {'rtp': 'vim/'}

" Initialize plugin system
call plug#end()

"let g:python2_host_prog = '/usr/local/bin/python'
"let g:python3_host_prog = '/usr/local/bin/python3'
