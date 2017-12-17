command! -nargs=1 TmuxCmd execute "!tmux split-window -c ".getcwd()." ". <f-args>

"if has('nvim')
  "cnoremap <expr> ! strlen(getcmdline())?'!':('!tmux split-window -c '.getcwd().' ')
"endif
