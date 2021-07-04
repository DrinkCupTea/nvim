let mapleader=" "
syntax on
set number
set relativenumber
set cursorline
set wrap
set showcmd
set wildmenu
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set scrolloff=3
set background=dark
set nrformats=

set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase
nnoremap <LEADER><CR> :set hlsearch!<CR>
" nnoremap / :set hlsearch<CR> /

map <LEADER>xc :set spell!<CR>
set nocompatible
filetype on
filetype indent on
filetype plugin on
set mouse=a
set encoding=utf-8
let &t_ut=''
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
" set list
" set listchars=tab:\|\ ,trail:▫
set list lcs=tab:\|\ ,trail:▫

" set exrc
" set secure

" noremap <C-x> ea<C-x>s
" inoremap <C-x> <ESC>ea<C-x>s

nnoremap <LEADER><LEADER> /<++><CR>c4l
inoremap ;f <ESC>/<++><CR>c4l
" nnoremap ;; <ESC>A;<ESC>

" map <F5> :call CompileAndRun()<CR>
func! CompileAndRun()
  exec "w"
  if &filetype == 'c'
    exec '!g++ % -o %<'
    exec '!./%<'
  elseif &filetype == 'cpp'
    exec '!g++ % -o %<'
    exec '!./%<'
  elseif &filetype == 'python'
    exec '!python %'
  elseif &filetype == 'sh'
    :!bash %
  elseif &filetype == 'markdown'
    exec MarkdownPreview
  endif
endfunc


" source ~/AppData/Local/nvim/key_map.vim
" source ~/AppData/Local/nvim/snippets.vim
source ~/.config/nvim/key_map.vim
source ~/.config/nvim/snippets.vim

" ###################################
" # Plug Manager                    #
" ###################################

call plug#begin('~/.config/nvim/plugged')
" === Apperance

Plug 'ajmwagar/vim-deus'
Plug 'Yggdroot/indentLine'
Plug 'phanviet/vim-monokai-pro'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'sheerun/vim-polyglot'
" Plug 'luochen1990/rainbow'
" Plug 'connorholyday/vim-snazzy'
" Plug 'mhartington/oceanic-next'
" Plug 'joshdick/onedark.vim'

" === Function
Plug 'preservim/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'preservim/nerdcommenter'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'majutsushi/tagbar'
Plug 'mg979/vim-xtabline'

" Enhance Editor
Plug 'tpope/vim-surround'
Plug 'gcmt/wildfire.vim'
Plug 'jiangmiao/auto-pairs'
" Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" === Code
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'liuchengxu/vista.vim'

" === Code Format
Plug 'Chiel92/vim-autoformat'
Plug 'junegunn/vim-easy-align'

" === CSS
Plug 'ap/vim-css-color'

" === Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install', 'for': 'markdown'}
Plug 'dhruvasagar/vim-table-mode', {'for': 'markdown'}

" === Flutter
" Plug 'thosakwe/vim-flutter'

" === QT
" Plug 'peterhoeg/vim-qml'

" === Vim Applications

call plug#end()

" ###################################
" # Colorscheme                     #
" ###################################

" colorscheme OceanicNext
" let g:airline_theme='oceanicnext'
" colorscheme monokai_pro
set termguicolors
colorscheme deus
let g:airline_theme='deus'
" let g:SnazzyTransparent = 1

" ###################################
" # NERD Tree                       #
" ###################################

" map <C-n> :NERDTreeToggle<CR>
"" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" change default arrows
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" ###################################
" # NERD Commenter                  #
" ###################################

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" ###################################
" # Coc Nvim                        #
" ###################################

let g:coc_global_extensions = ['coc-clangd', 'coc-css', 'coc-eslint', 'coc-explorer', 'coc-fzf-preview', 'coc-git', 'coc-go', 'coc-html', 'coc-htmlhint', 'coc-html-css-support', 'coc-java', 'coc-json', 'coc-markdownlint', 'coc-pyright', 'coc-sh', 'coc-snippets', 'coc-sql', 'coc-vimlsp', 'coc-xml', 'coc-yaml']

set updatetime=300
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
" if has('nvim')
"
"   inoremap <silent><expr> <c-space> coc#refresh()
" else
"   inoremap <silent><expr> <c-@> coc#refresh()
" endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" ###################################
" # Coc Explorer                    #
" ###################################

" Open explorer
nnoremap <space>e :CocCommand explorer<CR>

" ###################################
" # Coc Snippets                    #
" ###################################

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

" ###################################
" # Vista                           #
" ###################################

nnoremap <silent> <LEADER>f :Vista!!<CR>
nnoremap <silent> <LEADER>/ :Vista finder<CR>

" How each level is indented and what to prepend.
" This could make the display more compact or more spacious.
" e.g., more compact: ["▸ ", ""]
" Note: this option only works for the kind renderer, not the tree renderer.
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" " Executive used when opening vista sidebar without specifying it.
" " See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'ctags'

" " Set the executive for some filetypes explicitly. Use the explicit executive
" " instead of the default one for these filetypes when using `:Vista` without
" " specifying the executive.
let g:vista_executive_for = {
      \ 'cpp': 'coc',
      \ 'go': 'coc',
      \ }

" Declare the command including the executable and options used to generate ctags output
" for some certain filetypes.The file path will be appened to your custom command.
" For example:
" let g:vista_ctags_cmd = {
"       \ 'haskell': 'hasktags -x -o - -c',
"       \ }

" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1

" " The default icons can't be suitable for all the filetypes, you can extend it as you wish.
" let g:vista#renderer#icons = {
" \   "function": "\uf794",
" \   "variable": "\uf71b",
" \  }

let g:vista_update_on_text_changed_delay = 1
let g:vista_finder_alternative_executives = ['ctags']

" ###################################
" # Auto Format                     #
" ###################################

noremap <F3> :Autoformat<CR>

" ###################################
" # Markdown Preview                #
" ###################################

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" specify browser to open preview page
" default: ''
let g:mkdp_browser = 'firefox'


" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
" let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
" let g:mkdp_highlight_css = ''

" ###################################
" # Easy Align                      #
" ###################################

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Add my trigger
nmap <LEADER>= gaip=
xmap <LEADER>= gaip=
nmap <LEADER>2= gaip2=
xmap <LEADER>2= gaip2=
nmap <LEADER>* gaip*
xmap <LEADER>* gaip*
nmap <LEADER>: gaip:
xmap <LEADER>: gaip:

" ###################################
" # Wildfire                        #
" ###################################

let g:wildfire_objects = ["i'", 'i"', "i)", "i>", "i]", "i}", "ip", "it"]

" ###################################
" # Indent Line                     #
" ###################################

" let g:indentLine_setColors = 0
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
nnoremap <LEADER>l :IndentLinesToggle<CR>

" ###################################
" # TagBar                          #
" ###################################
let g:tagbar_width=30
" nnoremap <silent> <F4> :TagbarToggle<CR>

