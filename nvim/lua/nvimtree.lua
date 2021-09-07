local tree_cb = require "nvim-tree.config".nvim_tree_callback
vim.g.nvim_tree_lsp_diagnostics=1
var_tbl {
  nvim_tree_width              = 40,
  nvim_tree_indent_markers     = 1,
  nvim_tree_follow             = 1,
  nvim_tree_quit_on_open       = 1,
  nvim_tree_git_hl             = 1,
  nvim_tree_width_allow_resize = 1,
  nvim_tree_ignore             = { ".git", ".cache", ".idea", ".DS_Store" },
  nvim_tree_special_files      = { 'README.md', 'Makefile', 'MAKEFILE' },

  nvim_tree_icons              = {
    git         = {
      unstaged  = font_icon.modifiy,
      staged    = font_icon.add,
      unmerged  = font_icon.merge,
      renamed   = font_icon.renamed,
      untracked = font_icon.unknown,
      deleted   = font_icon.deleted,
      ignored   = font_icon.ignored
    },
  }
}

vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', { noremap = true })
