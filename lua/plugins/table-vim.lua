return {
  "numEricL/table.vim",
  -- Cargar solo en tipos de archivo donde es útil (lazy loading)
  ft = { "markdown", "text", "org" },
  
  -- Si necesitas configuración específica, se hace aquí.
  -- Por defecto este plugin suele funcionar bien sin configuración extra.
  config = function()
    -- Ejemplo: desactivar mapeos automáticos si entran en conflicto
    -- vim.g.table_mode_disable_mappings = 1
    
    -- Opcional: Forzar compatibilidad con Markdown si no lo detecta
    vim.g.table_mode_corner = '|'
  end,
}
