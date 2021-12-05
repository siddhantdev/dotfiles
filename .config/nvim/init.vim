if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

set clipboard+=unnamedplus

set number relativenumber

set wrap

set tabstop=4
set autoindent
set smartindent
set expandtab
set shiftwidth=4
set softtabstop=4

set ignorecase
set smartcase

set mouse=a

set cursorline

autocmd InsertEnter * norm zz


set termguicolors

set nohls
set wildmode=longest,list,full

set path+=**

set nobackup

nnoremap c "_c
vnoremap c "_c

let mapleader="\<Space>"
nnoremap <leader>w :w<cr>
nnoremap <leader>d "_d
vnoremap <leader>d "_d

nnoremap <C-a> <Esc>ggVG
inoremap <C-a> <Esc>ggVG

nnoremap <leader>t :tabnew<cr>

" Splits
nnoremap <leader>v :vsplit<cr>
nnoremap <leader>b :split<cr>

nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>h <C-W><C-H>
nnoremap <leader>l <C-W><C-L>

set splitbelow
set splitright

map <leader>s :setlocal spell! spelllang=en_us<cr>
nnoremap S :%s//g<Left><Left>
"
" Compiling shortcuts
autocmd filetype cpp nnoremap <buffer> <F4> :!g++ -o %:r.out % -std=c++14 -Wall -Wextra -Wshadow -O2<cr>
autocmd filetype cpp nnoremap <buffer> <F5> :!g++ -o %:r.out % -std=c++17 -Wall -Wextra -Wshadow -O2<cr>
autocmd filetype markdown nnoremap <buffer> <F5> :!pandoc -f markdown % -o %:r.pdf<cr>
autocmd filetype java nnoremap <buffer> <F5> :!javac %<cr>

" Execution shortcuts
autocmd filetype cpp nnoremap <buffer> <F6> :!./%:r.out < input.txt<cr>
autocmd filetype markdown nnoremap <buffer> <F6> :!xdg-open %:r.pdf<cr>
autocmd filetype java nnoremap <buffer> <F6> :!java %:r<cr>

" Template autoloadin
autocmd BufNewFile *.cpp 0r ~/Templates/C++.cpp
autocmd BufNewFile *.md 0r ~/Templates/Markdown.md

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\n\+\%$//e
autocmd BufWritePre *.[ch] %s/\%$/\r/e

nnoremap <Tab> %

call plug#begin()

Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'ryanoasis/vim-devicons'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-commentary'
Plug 'junegunn/goyo.vim'
Plug 'catppuccin/nvim'
Plug 'nvim-lualine/lualine.nvim'

call plug#end()

colorscheme catppuccin

nnoremap <leader>c :NERDTreeToggle<cr>
nnoremap <leader>f :NERDTreeFocus<cr>

let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0

let g:webdevicons_conceal_nerdtree_brackets = 1

nnoremap <leader>g :Goyo<cr>

lua << END
require'lualine'.setup {
    options = {
        theme = 'catppuccin',
        section_separators = ' ',
        component_separators = '|'
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff'},
        lualine_c = {'filename'},
        lualine_x = {'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    }
}
END
