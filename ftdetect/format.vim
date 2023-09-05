" echom "in abc.vim"


 " avoid auto insert comment when press o or O
au FileType lua,typescript,javascript,go,rust  setlocal formatoptions-=o
