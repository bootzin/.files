" _                            _     _               _
"| |                _         (_)   ( )             (_)
"| | _   ___   ___ | |_  _____ _ ___|/  ___    _   _ _ ____   ____ ____
"| || \ / _ \ / _ \|  _)(___  ) |  _ \ /___)  | | | | |    \ / ___) ___)
"| |_) ) |_| | |_| | |__ / __/| | | | |___ |   \ V /| | | | | |  ( (___
"|____/ \___/ \___/ \___|_____)_|_| |_(___/     \_/ |_|_|_|_|_|   \____)
"


" Load plugins with Pathogen
	execute pathogen#infect()
	execute pathogen#helptags()

"General Config
	set nocompatible
	filetype plugin indent on
	syntax on
	"colorscheme wal
	set enc=utf-8
	set number
	set relativenumber
	set splitbelow
	set splitright
	set mouse=a

"Command typo for saving and exit
	:command WQ wq
	:command Wq wq
	:command W w
	:command Q q
" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

"Command autocompletion
	set wildmode=longest,list,full
	set wildmenu

" Navigating with guides
	inoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
	vnoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
	map <Space><Tab> <Esc>/<++><Enter>"_c4l
	inoremap ;gui <++>

"Traverse line breaks with arrow keys
	set whichwrap=b,s,<,>,[,]

"Indentation
	set smartindent
	set autoindent
	set smarttab
	set shiftwidth=4
	set tabstop=4

"Set matching parenthesis
	set showmatch

"Searching config
	" set hlsearch
	set ignorecase
	set smartcase

"onmifunction syntax completion
	set omnifunc=syntaxcomplete#Complete
" AUTOCOMMANDS
	au FileType	mail set tw=80
	au VimEnter	* call ViewFortune()

" When shortcut files are updated, renew bash and ranger configs with new
" material:
	autocmd BufWritePost ~/Software/scripts/folders,~/Software/scripts/configs !bash ~/Software/scripts/shortcuts.sh

" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


" Automatically deletes all tralling whitespace on save.
	autocmd BufWritePre * %s/\s\+$//e

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
	autocmd VimLeave *.tex !texclear

" Enable Goyo by default for mutt writting
	" Goyo's width will be the line limit in mutt.
	autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=72
	autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo

" Interpret .md files, etc. as .markdown
	let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

" Make calcurse notes markdown compatible:
	autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown


" KEY MAPPING
nnoremap <SPACE> <Nop>
let mapleader=" "
map <leader>s :so ~/.vimrc<CR>
nmap <leader>w :w<CR>
nmap <leader>q :q<cr>
set backspace=2
" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l
" Open my bibliography file in split
	map <F9> :vsp<space>~/Documents/LaTeX/uni.bib<CR>
" Compile document
	map <leader>c :!compiler <c-r>%<CR>
" Spell check set to F6:
	map <F6> :setlocal spell! spelllang=pt_br,en_us<CR>
" Use urlview to choose and open a url:
	:noremap <leader>u :w<Home>silent <End> !urlview<CR>
" Copy selected text to system clipboard (requires xclip installed):
	vnoremap <C-c> "cy<esc>:!echo -n '<C-R>c' \|<space>xclip<CR><enter>
" Goyo plugin makes text more readable when writing prose:
	map <F10> :Goyo<CR>
	map <leader>f :Goyo<CR>
	inoremap <F10> <esc>:Goyo<CR>a
" Limelight Goyo Integration
	autocmd! User GoyoEnter Limelight
	autocmd! User GoyoLeave Limelight!
" C-T for new tab
	nnoremap <C-t> :tabnew<cr>
"Reopen last opened file
	nnoremap <leader><leader> :e#<CR>
"Tab
inoremap <Tab> <C-R>=BetterTab()<CR>

" FUNCTIONS
fu! BetterTab()
	if strpart(getline('.'), clo('.')-2, 1) =~ '^\s*$'
		return "\<Tab>"
	else
		return "\<C-N>"
	endif
endfu

fu! ViewFortune()
	if filereadable('/usr/bin/fortune')
		if filereadable('/usr/share/fortune/vimtips')
			echomsg system('/usr/bin/fortune vimtips')
		endif
	endif
endfu


""" LaTeX SHORTCUTTING
	" Word Count:
	autocmd FileType tex map <F3> :w !detex \| wc -w<CR>
	autocmd FileType tex inoremap <F3> <Esc>:w !detex \| wc -w<CR>
	" Compile using xelatex
	autocmd FileType tex inoremap <F5> <Esc>:!xelatex<space><c-r>%<Enter>a
	autocmd FileType tex nnoremap <F5> :!xelatex<space><c-r>%<Enter>
	" Code Snippets
	autocmd FileType tex vnoremap ; <ESC>`<i\{<ESC>`>2la}<ESC>?\\{<Enter>a
	autocmd FileType tex inoremap ;sec \section{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ;ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ;sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ;ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
	autocmd FileType tex inoremap ;ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
	autocmd FileType tex inoremap ;li <Enter>\item<Space>
	autocmd FileType tex inoremap ;bf \textbf{}<++><Esc>T{i
	autocmd FileType tex inoremap ;em \emph{}<++><Esc>T{i
	autocmd FileType tex inoremap ;up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
	autocmd FileType tex nnoremap ;up /usepackage<Enter>o\usepackage{}<Esc>i

	"Math and logical symbols
	autocmd FileType tex inoremap ;m $$<Space><++><Esc>2T$i






"General Config
"set tags+=~/.vim/systags
"set lbr "enable line break

" KEY MAPPING
"map j gj
"map k gk

"statusline
"set statusline=-
"set laststatus=0 noruler

" PLUGINS
"Limelight
" let g:limelight_conceal_ctermfg = 'DarkGray'
" let g:limelight_conceal_guifg = 'DarkGray'
" let g:limelight_default_coefficient = 0.2
" let g:limelight_paragraph_span = 1



