return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- 1. Cargar tus iconos personalizados
    -- Asegúrate de que el archivo lua/core/plugin_config/icons.lua exista y devuelva una tabla
    local icons = require("core.icons")

    -- 2. Función on_attach (Mapeos y comportamiento)
    local function my_on_attach(bufnr)
      local api = require("nvim-tree.api")

      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      -- Mapeos por defecto
      api.config.mappings.default_on_attach(bufnr)

      -- Tus mapeos personalizados
      vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
      vim.keymap.set('n', '?',     api.tree.toggle_help,           opts('Help'))
      vim.keymap.set('n', 'l',     api.node.open.edit,             opts('Open'))
    end

    -- 3. Colores personalizados para las flechas (Cyan)
    vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#2AC3DE ]])
    vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#2AC3DE ]])

    -- 4. Configuración principal (Setup)
    require("nvim-tree").setup({
      on_attach = my_on_attach,
      hijack_directories = {
        enable = false,
      },
      filters = {
        custom = { ".git" },
        exclude = {},
      },
      update_cwd = true, -- false si sientes que el árbol "pierde" la visión general del proyecto. 
      renderer = {
        add_trailing = false,
        group_empty = false,
        highlight_git = false,
        highlight_opened_files = "none",
        root_folder_modifier = ":t",
        indent_markers = {
          enable = false,
          icons = {
            corner = "└ ",
            edge = "│ ",
            none = "  ",
          },
        },
        icons = {
          webdev_colors = true,
          git_placement = "before",
          padding = " ",
          symlink_arrow = " ➛ ",
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = false,
          },
          glyphs = {
            default = "",
            symlink = "",
            folder = {
              arrow_open = icons.ui.ArrowOpen,
              arrow_closed = icons.ui.ArrowClosed,
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
            },
            git = {
              unstaged = "",
              staged = "S",
              unmerged = "",
              renamed = "➜",
              untracked = "U",
              deleted = "",
              ignored = "◌",
            },
          },
        },
      },
      diagnostics = {
        enable = true,
        icons = {
          hint = icons.diagnostics.Hint,
          info = icons.diagnostics.Information,
          warning = icons.diagnostics.Warning,
          error = icons.diagnostics.Error,
        },
      },
      update_focused_file = {
        enable = true,
        update_cwd = true, -- false si sientes que el árbol "pierde" la visión general del proyecto. 
        ignore_list = {},
      },
      git = {
        enable = true,
        ignore = false,
        timeout = 500,
      },
      view = {
        width = 30,
        side = "left",
        number = false,
        relativenumber = false,
      },
    })
  end
}
