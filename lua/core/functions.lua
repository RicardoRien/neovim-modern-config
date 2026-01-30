-- F5 change colorsheme
local themes = {
  { "tokyonight",       "dark" },
  { "tokyonight-day",   "light" },
  { "tokyonight-moon",  "dark" },
  { "tokyonight-storm", "dark" },
  { "tokyonight-night", "dark" },
  { "gruvbox",          "dark" },
  { "gruvbox",          "light" },
}

local current_theme_idx = 0

vim.keymap.set("n", "<F5>", function()
  current_theme_idx = (current_theme_idx % #themes) + 1

  local theme_entry = themes[current_theme_idx]
  local theme_name = theme_entry[1]

  local theme_bg = theme_entry[2]
  vim.o.background = theme_bg

  local status_ok, _ = pcall(vim.cmd.colorscheme, theme_name)

  if status_ok then
    print("Colorscheme: " .. theme_name .. " [" .. theme_bg .. "]")
  else
    print("Error: No se encontró el tema " .. theme_name)
  end
end, { desc = "Ciclar temas (Tokyonight + Gruvbox)" })
--------------------------------------------------------------------
