" === Markdown ===
autocmd Filetype markdown inoremap ;f <ESC>/<++><CR>c4l
autocmd Filetype markdown inoremap ;b ****<++><ESC>F*hi
autocmd Filetype markdown inoremap ;i ** <++><ESC>F*i
autocmd Filetype markdown inoremap ;p ![](<++>)<++><ESC>F[a
autocmd Filetype markdown inoremap ;a [](<++>)<++><ESC>F[a
autocmd Filetype markdown inoremap ;l $$ <++><ESC>F$i
autocmd Filetype markdown inoremap ;L $$<ENTER><++><ENTER>$$<ENTER><ENTER><++><ESC>4kA
autocmd Filetype markdown inoremap ;c ```<ENTER><++><ENTER>```<ENTER><ENTER><++><ESC>4kA
" autocmd Filetype markdown inoremap ;
autocmd Filetype markdown inoremap ;1 # 
autocmd Filetype markdown inoremap ;2 ## 
autocmd Filetype markdown inoremap ;3 ### 
autocmd Filetype markdown inoremap ;4 #### 
autocmd Filetype markdown inoremap ;5 ##### 
autocmd Filetype markdown inoremap ;6 ###### 
