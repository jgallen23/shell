nnoremap <silent> <space> :Buffers<CR>
nnoremap <silent> \ :Files<CR>
nnoremap <silent> <leader>fw :FZF $WORKDIR<CR>
nnoremap <silent> <leader>fn :FZF ./node_modules<CR>
nnoremap <silent> <leader>fu :FZF %:p:h/..<CR>
nnoremap <silent> <leader>ff :FZF -q <cfile><CR>
nnoremap <silent> <leader>fo :FZF -q <cword><CR>
nnoremap <silent> <leader>\ :FZF %:p:h<CR>
nnoremap <leader>s :Ag 
