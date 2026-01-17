 -- To put color in the border of the windows
return {
  "nvim-zh/colorful-winsep.nvim",
  event = { "WinNew" },
  config = function()
    -- 1. CONFIGURACIÓN DE COLORES (Todo va aquí ahora)
    -- Definimos el grupo "NvimSeparator" con el color que quieras.
    -- fg = color del borde, bg = color de fondo (opcional)
    vim.api.nvim_set_hl(0, "NvimSeparator", { fg = "#9D7CD8", bg = "#16161E" })

    -- 2. CONFIGURACIÓN DEL PLUGIN
    require("colorful-winsep").setup({
      -- ELIMINADO: highlight = { ... } (Esto es lo que causaba el error)
      -- Frecuencia de actualización
      interval = 30,
      -- Archivos donde NO quieres que se active
      no_exec_files = { "packer", "TelescopePrompt", "mason", "CompetiTest", "NvimTree", "alpha", "dashboard", "lazy" },
      -- Símbolos del borde
      symbols = { "━", "┃", "┏", "┓", "┗", "┛" },
    })
  end
}
