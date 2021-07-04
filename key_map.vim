" inoremap jk <ESC>
nnoremap H ^
nnoremap L $
nnoremap ^ H
nnoremap $ L
nnoremap dH d^
nnoremap dL d$
nnoremap d^ dH
nnoremap d$ dL
nnoremap cH c^
nnoremap cL c$
nnoremap c^ cH
nnoremap c$ cL
xnoremap H ^
xnoremap L $
xnoremap ^ H
xnoremap $ L

map sr :set splitright<CR>:vsplit<CR>
map sl :set nosplitright<CR>:vsplit<CR>
map su :set nosplitbelow<CR>:split<CR>
map sd :set splitbelow<CR>:split<CR>

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

" nnoremap t T
" nnoremap T t

nnoremap ++ <C-a>
nnoremap -- <C-x>

nnoremap <M-z> :edit ~/.config/nvim/init.vim<CR>
nnoremap <M-R> :source ~/.config/nvim/init.vim<CR>
" nnoremap <M-z> :edit ~/AppData/Local/nvim/init.vim<CR>
" nnoremap <M-r> :source ~/AppData/Local/nvim/init.vim<CR>

autocmd Filetype dart nnoremap R :CocCommand flutter.run
autocmd Filetype dart nnoremap Q :CocCommand flutter.dev.quit


