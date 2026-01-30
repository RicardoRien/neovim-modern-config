vim.lsp.config("ts_ls", {
	on_attach = function(client, bufnr) end,
	filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact" },
	cmd = { "typescript-language-server", "--stdio" },
	settings = {
		-- FOR JAVASCRIPT (.js)
		javascript = {
			implicitProjectConfiguration = {
				checkJs = true,
				strict = false, -- Apaga el modo estricto general
				strictNullChecks = false, -- Allows null/undefined (Goodbye error 2322)
				noImplicitAny = false, -- Allows tipos 'any' (Goodbye error 7044)
				target = "ES2023",
			},
		},
		-- FOR TYPESCRIPT (.ts)
		typescript = {
			-- TS, Here! implicitProjectConfiguration if you want:
			implicitProjectConfiguration = {},
			inlayHints = {
				enumMemberValues = { enabled = true },
				functionLikeReturnTypes = { enabled = true },
				parameterNames = { enabled = "literals" },
				parameterTypes = { enabled = true },
			},
		},
		-- Other Global Configurations
		completions = {
			completeFunctionCalls = true,
		},
	},
})
