local plugins = {}

-- Try deleting gd and gD mappings safely
local success, _ = pcall(vim.keymap.del, 'n', 'gd', { silent = true })
local success, _ = pcall(vim.keymap.del, 'n', 'gD', { silent = true })

-- Map gd to LSP definition
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { noremap = true, silent = true, desc = 'Go to definition' })

-- Map gD to LSP declaration
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { noremap = true, silent = true, desc = 'Go to declaration' })

return plugins
