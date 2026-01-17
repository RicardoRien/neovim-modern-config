return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    -- Textobjects dependency
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
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

      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Salta automáticamente al siguiente objeto si no estás sobre uno
          keymaps = {
            -- Puedes usar 'a' (around) o 'i' (inner)
            -- Funciones (Genial para tus tests de Playwright)
            ["af"] = "@function.outer", -- Selecciona TODA la función (incluyendo 'export function...')
            ["if"] = "@function.inner", -- Selecciona solo el CONTENIDO de la función

            -- Clases
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",

            -- Bucles (For, While)
            ["al"] = "@loop.outer",
            ["il"] = "@loop.inner",

            -- Condicionales (If, Switch)
            ["ai"] = "@conditional.outer",
            ["ii"] = "@conditional.inner",

            -- Parámetros (Argumentos dentro de paréntesis)
            ["aa"] = "@parameter.outer", -- Selecciona el argumento y la coma
            ["ia"] = "@parameter.inner", -- Selecciona solo el argumento

            ["oc"] = "@comment.outer", -- Selecciona TODO el bloque de comentario
          },
        },
        -- Moverte rápido entre funciones (como saltar de test en test)
        move = {
          enable = true,
          set_jumps = true, -- Guarda el salto en la lista de saltos (C-o para volver)
          goto_next_start = {
            ["]f"] = "@function.outer",
            ["]c"] = "@class.outer",
          },
          goto_next_end = {
            ["]F"] = "@function.outer",
            ["]C"] = "@class.outer",
          },
          goto_previous_start = {
            ["[f"] = "@function.outer",
            ["[c"] = "@class.outer",
          },
          goto_previous_end = {
            ["[F"] = "@function.outer",
            ["[C"] = "@class.outer",
          },
        },
      },
    })
  end
}
