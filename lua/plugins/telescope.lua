return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  }, -- Falta esta llave para cerrar dependencies
  config = function()
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>b", "<cmd>Telescope buffers<cr>", {})
    vim.keymap.set("n", "<leader>1", "<cmd>Telescope diagnostics<cr>", {})
    vim.keymap.set("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", {})
    -- Live Grep: find a word inside the folder
    vim.keymap.set("n", "<c-g>", ":Telescope live_grep<CR>", {})
    vim.keymap.set("n", "<c-c>", ":Telescope neoclip<CR>", {})
  end
}

