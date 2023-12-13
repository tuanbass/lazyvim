" echom "in abc.vim"


 " avoid auto insert comment when press o or O
au FileType lua,typescript,javascript,go,rust  setlocal formatoptions-=o


" create a local map for lazyterm to avoid duplicate term"
au FileType lazyterm lua vim.api.nvim_buf_set_keymap(0, 'n', '<C-/>', '<cmd>close<CR>', {noremap = true, silent = true})
" au FileType lazyterm lua print("in lazyterm")

