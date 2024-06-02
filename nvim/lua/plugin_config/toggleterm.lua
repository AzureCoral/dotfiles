local toggleterm = require('toggleterm')

vim.keymap.set('n', '<C-\\>', function()
    toggleterm.toggle()
end, { noremap = true, silent = true })

vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]])
vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]])
vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]])
vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]])

vim.keymap.set('t', '<C-v>', [[<Cmd>startinsert<CR><Cmd>stopinsert<CR>V]], { noremap = true, silent = true })

toggleterm.setup {
    size = 20,
    open_mapping = '<C-\\>',
    direction = 'horizontal',
    auto_scroll = true,
    close_on_exit = true,
    persist_size = true,
}
