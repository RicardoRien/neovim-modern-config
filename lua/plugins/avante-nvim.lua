return {
  "yetone/avante.nvim",
  build = "make",
  event = "VeryLazy",
  lazy = false, -- Avante recomienda no ser lazy para cargar sus comandos al inicio
  -- version = false, -- Usar siempre la última versión (nightly)
  version = 'e89eb79', -- Fixing this to avoid issues in the future
  opts = {
    provider = "gemini",
    windows = {
      position = "right", -- Puedes ponerlo a la izquierda "left" si prefieres
      width = 45,         -- Ancho de la barra lateral (Default: 30)
      sidebar_header = {
        align = "center", -- "center" | "left" | "right"
        rounded = true,
      },
    },
    providers = {
      gemini = {
        -- Models: https://ai.google.dev/gemini-api/docs/models?hl=es-419#gemini-3-flash-preview
        model = "gemini-2.0-flash-001",
        timeout = 30000, -- Timeout in milliseconds
          extra_request_body = {
            temperature = 0, -- From 0 to 1, means "creativity" we want science!
            max_tokens = 8192,
            reasoning_effort = "medium", -- low | medium | high, only used for reasoning models
          },
        },
    },
    -- Comportamiento de la ventana y UI
    behaviour = {
      auto_suggestions = false, -- Ponlo en true si quieres sugerencias tipo Copilot mientras escribes
      auto_set_highlight_group = true,
      auto_set_keymaps = true,
      auto_apply_diff_after_generation = false,
      support_paste_from_clipboard = true,
    },

    mcp = {
      servers = {
      -- Nombre arbitrario para tu servidor
      ["playwright"] = {
        -- El comando para iniciar el servidor MCP
        -- Asegúrate de usar el nombre correcto del paquete npm del servidor que quieres usar
        command = "npx",
        args = { "-y", "@modelcontextprotocol/server-playwright" -- O el paquete que estés usando (ej: @execute/mcp-playwright)
        },
      },
      -- More servers herek
     },
    },
    -- 4. Mapeos de teclas (opcional, estos son los default)
    mappings = {
      diff = {
        ours = "co",       -- Choose Ours (Keep your original code)
        theirs = "ct",     -- Choose Theirs (Accept the AI generated code)
        all_theirs = "ca", -- Choose All Theirs (Accept all AI changes in the file)
        both = "cb",       -- Choose Both (Keep both original and AI code)
        cursor = "cc",     -- Choose Cursor (Pick the version where your cursor is)
        next = "]x",       -- Move to Next conflict/diff
        prev = "[x",       -- Move to Previous conflict/diff
      },
      suggestion = {
        accept = "<M-l>",  -- Accept the ghost text suggestion
        next = "<M-]>",    -- Cycle to Next suggestion (if multiple options exist) Alt + ]
        prev = "<M-[>",    -- Cycle to Previous suggestion
        dismiss = "<C-]>", -- Dismiss/Cancel the suggestion
      },
      jump = {
        next = "]]",       -- Jump to Next code block/header in chat
        prev = "[[",       -- Jump to Previous code block/header in chat
      },
      submit = {
        normal = "<CR>",   -- Submit message (Press Enter in Normal Mode)
        insert = "<C-s>",  -- Submit message (Press Ctrl+s in Insert Mode)
      },
  },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "nvim-mini/mini.pick", -- for file_selector provider mini.pick
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    "ibhagwan/fzf-lua", -- for file_selector provider fzf
    "stevearc/dressing.nvim", -- for input provider dressing
    "folke/snacks.nvim", -- for input provider snacks
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    -- "zbirenbaum/copilot.lua", -- for providers='copilot'
    {
      -- Make sure to set this up properly if you have lazy=true
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
