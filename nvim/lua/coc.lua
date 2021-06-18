vim.api.nvim_set_keymap('n', '<Leader>f', ':<C-u>CocList files<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>m', ':<C-u>CocList mru<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>g', ':CocList grep<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>w', ':exe \'CocList -I --normal --input=\'.expand(\'<cword>\').\' words\'<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', 'rn', '<plug>(coc-rename)',{})
vim.api.nvim_set_keymap('i', '<C-j>', '<plug>(coc-snippets-expand-jump)',{})
vim.api.nvim_set_keymap('n', 'gd', '<plug>(coc-definition)',{ silent = true })
vim.api.nvim_set_keymap('n', 'gr', '<plug>(coc-references)',{ silent = true })
vim.api.nvim_set_keymap('n', 'gh', ':call CocAction(\'doHover\')<CR>',{ noremap = true })
vim.api.nvim_set_keymap('n', '[d', '<plug>(coc-diagnostic-prev)',{ silent = true })
vim.api.nvim_set_keymap('n', ']d', '<plug>(coc-diagnostic-next)',{ silent = true })

