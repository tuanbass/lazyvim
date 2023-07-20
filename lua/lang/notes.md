# some notes

## Lsp options loading

- because of lazy.nvim, opts function will be executed for all file types, when the first file that active the lspconfig or null-ls

## Formatter

- For the formatter: All formatter in the list will be used,one after one the list can be determinded using LspInfo and NullLsInfo

- for example, lua uses stylua (configured with stylua.toml/.editorconfig) and lua-lang-server (.editorconfig):
  - notes: if we found style.toml, the .editorconfig will be ignored
    stylua ref: <https://github.com/JohnnyMorganz/StyLua>
