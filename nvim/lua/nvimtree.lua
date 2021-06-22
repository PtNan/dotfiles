vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', { noremap = true })
vim.g.nvim_tree_lsp_diagnostics=1
vim.g.nvim_tree_show_icons = {
        git= 1,
        folders= 0,
        files= 0,
        folder_arrows= 0
    }
vim.g.nvim_tree_icons = {
    default= '',
    symlink= '',
    git= {
        unstaged= "✗",
        staged= "✓",
        unmerged= "",
        renamed= "➜",
        untracked= "★",
        deleted= "",
        ignored= "◌"
    },
    lsp= {
        hint= "",
        info= "",
        warning= "",
        error= "",
    }
}
