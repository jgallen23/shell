set showtabline=1

let g:lightline = {
    \ 'colorscheme': 'base16_solarized',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'fugitive', 'readonly', 'relativepath', 'modified' ] ]
    \ },
    \ 'component': {
    \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
    \ },
    \ 'component_visible_condition': {
    \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
    \ }
  \ }
