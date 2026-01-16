return {
    "cbochs/grapple.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons", lazy = true
    },
    config = function()
      require("telescope").load_extension("grapple")

      --[[ vim.keymap.set("n", "<c-h>", "<cmd>Telescope grapple tags<cr>") SHOW IN TELESCOPE]]
      vim.keymap.set("n", "<leader>ha", "<cmd>Grapple tag<cr>")
      vim.keymap.set("n", "<leader>hh", "<cmd>Grapple open_tags<cr>")

      -- vim.keymap.set("n", "<leader>hu", "<cmd>Grapple select index=1<cr>")
      -- vim.keymap.set("n", "<leader>hi", "<cmd>Grapple select index=2<cr>")
      -- vim.keymap.set("n", "<leader>ho", "<cmd>Grapple select index=3<cr>")
      -- vim.keymap.set("n", "<leader>hp", "<cmd>Grapple select index=4<cr>")

      -- Toggle previous & next buffers
      --[[ vim.keymap.set("n", "<C-hn>", "<cmd>Grapple cycle backward<cr>") ]]
      --[[ vim.keymap.set("n", "<C-hb>", "<cmd>Grapple cycle forward<cr>") ]]
    end
  }
