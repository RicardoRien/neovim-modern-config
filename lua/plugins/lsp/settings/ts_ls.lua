return {
  settings = {
    implicitProjectConfiguration = {
      checkJs = true,
      strictFunctionTypes = true,
      strictNullChecks = true,
      target = "ES2022",
    },
  },
  -- Si usas plugins extra como typescript.nvim, esto sirve, 
  -- si es lspconfig puro, estas keys extra no estorban.
  init_options = {
    preferences = {
      includeInlayParameterNameHints = "all",
      includeInlayFunctionLikeReturnTypeHints = true,
    }
  }
}
