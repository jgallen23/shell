" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>
" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>
" Inspect runner pane
map <Leader>vi :VimuxInspectRunner<CR>
" Zoom the tmux runner pane
map <Leader>vz :VimuxZoomRunner<CR>
map <Leader>vc :VimuxCloseRunner<CR>
map <Leader>vt :VimuxTogglePane<CR>

function! VimuxRunCommandInDirFish(command, useFile)
    let l:file = ""
    if a:useFile ==# 1
        let l:file = shellescape(expand('%:t'), 1)
    endif
    call VimuxRunCommand("cd ".shellescape(expand('%:p:h'), 1)." ; ".a:command." ".l:file)
endfunction

function! VimuxPromptCommandInDir(...)
  let command = a:0 == 1 ? a:1 : ""
  let l:command = input(_VimuxOption("g:VimuxPromptString", "Command? "), command)
  call VimuxRunCommandInDirFish(l:command, 0)
endfunction

command -nargs=? VimuxPromptCommandInDir :call VimuxPromptCommandInDir(<args>)
map <Leader>vd :VimuxPromptCommandInDir<CR>

