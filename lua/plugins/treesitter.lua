return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master", -- <--- ESTA LÍNEA ES LA CLAVE DE LA SOLUCIÓN
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = { 
        "lua", "javascript", "typescript", "tsx", "html", "css", "json" 
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
