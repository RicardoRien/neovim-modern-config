vim.lsp.config("ts_ls", {
  on_attach = function(client, bufnr)

  end,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact" },
  cmd = { "typescript-language-server", "--stdio" },
  settings = {
    implicitProjectConfiguration = {
      checkJs = true,
      strict = true, -- <--- ESTO ACTIVA EL MODO ESTRICTO GLOBAL
      strictFunctionTypes = true,
      strictNullChecks = true,
      target = "ES2022",
    },
  },
})
