local actions = require('telescope.actions')
local bi = require('telescope.builtin')
require('telescope').setup{
    defaults = {
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case'
        },
        mappings = {
            n = {
                ["<esc>"] = actions.close,
            }
        },
        prompt_prefix = "> ",
        selection_caret = "> ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            mirror = false,
          },
          vertical = {
            mirror = false,
          },
        },
        file_sorter =  require'telescope.sorters'.get_fuzzy_file,
        file_ignore_patterns = {},
        generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
        shorten_path = true,
        winblend = 0,
        border = {},
        borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        color_devicons = true,
        use_less = true,
        set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
        file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
        grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
        qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
    },
    vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>lua require(\'telescope.builtin\').find_files()<cr>', { noremap = true }),
    vim.api.nvim_set_keymap('n', '<leader>r', '<cmd>lua require(\'telescope.builtin\').live_grep()<cr>', { noremap = true }),
    vim.api.nvim_set_keymap('n', '<leader>g', '<cmd>lua require(\'telescope.builtin\').git_files()<cr>', { noremap = true }),
    vim.api.nvim_set_keymap('n', '<leader>d', '<cmd>lua require(\'telescope.builtin\').lsp_document_diagnostics()<cr>', { noremap = true }),
    vim.api.nvim_set_keymap('n', '<leader>D', '<cmd>lua require(\'telescope.builtin\').lsp_workspace_diagnostics()<cr>', { noremap = true }),
}
