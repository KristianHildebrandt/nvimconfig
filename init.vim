"<Leader>r  Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'kien/ctrlp.vim'
Plug 'flazz/vim-colorschemes'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-unimpaired'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'tpope/vim-rails'
Plug 'scrooloose/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-surround'
Plug 'Lokaltog/vim-easymotion'
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-sneak'
Plug 'valloric/MatchTagAlways'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-projectionist'
Plug 'andyl/vim-projectionist-elixir'
Plug 'c-brenn/fuzzy-projectionist.vim'
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
Plug 'ngmy/vim-rubocop'
Plug 'posva/vim-vue'
Plug 'mhinz/vim-mix-format'
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'}
Plug 'tpope/vim-rhubarb'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'liuchengxu/vista.vim'

" Initialize plugin system
call plug#end()

let g:python_host_prog = '~/.asdf/installs/python/2.7.18/bin/python'
let g:python3_host_prog = '~/.asdf/installs/python/3.10.0/bin/python'
