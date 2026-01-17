return {
  "RRethy/vim-illuminate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("illuminate").configure({
      filetypes_denylist = { "alpha", "NvimTree", "DressingSelect", "TelescopePrompt", "lazy" },
    })

    local map = vim.keymap.set
    local opts = { noremap = true, silent = true, desc = "Siguiente palabra resaltada" }

    -- Usando CONTROL en lugar de ALT
    -- Cuidado: Esto reemplaza la función nativa de "bajar línea" de Vim
    map("n", "<C-n>", function() require("illuminate").next_reference{wrap=true} end, opts)

    opts.desc = "Anterior palabra resaltada"
    -- Cuidado: Esto reemplaza la función nativa de "subir línea" de Vim
    map("n", "<C-p>", function() require("illuminate").next_reference{reverse=true,wrap=true} end, opts)
  end
}
