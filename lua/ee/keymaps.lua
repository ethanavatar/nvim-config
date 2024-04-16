vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<leader>n', '<CMD>Oil --float<CR>', { desc = 'Open parent directory (Oil.nvim)' })

-- This is better than `"_dP` because it doesn't mess up in blockwise visual mode
vim.keymap.set({ 'x', 'n' }, 'p', '"0p', { desc = 'Replace-paste without overwriting the yank register' })

vim.keymap.set('n', 'n', 'nzz', { desc = 'Move to next search result and center the view on the cursor' })
vim.keymap.set('n', 'N', 'Nzz', { desc = 'Move to previous search result and center the view on the cursor' })
vim.keymap.set('n', '}', '}zz', { desc = 'Move to next paragraph and center the view on the cursor' })
vim.keymap.set('n', '{', '{zz', { desc = 'Move to previous paragraph and center the view on the cursor' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down half a page and center the view on the cursor' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up half a page and center the view on the cursor' })

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
