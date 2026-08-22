return 
{
	{
		"mason-org/mason.nvim",
		opts = {},
	},

	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = 
		{
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = 
		{
			ensure_installed = {
				"lua_ls",
				"pyright",
				"ts_ls",
				"html",
				"cssls",
				"jsonls",
			},
		},
	},

	{
	"saghen/blink.cmp",
	version = "*",
	opts = {
		keymap = {
			preset = "default",

			["<Tab>"] = {
				function(cmp)
					if cmp.is_menu_visible() then
						return cmp.accept()
					end
				end,
				"fallback",
			},

			["<CR>"] = { "accept", "fallback" },
		},

		completion = {
			menu = {
				auto_show = true,
			},
		},
	},
	},
	
	{
    "neovim/nvim-lspconfig",
    config = function()
        local navic = require("nvim-navic")

        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                local client = vim.lsp.get_client_by_id(args.data.client_id)

                if client and client.server_capabilities.documentSymbolProvider then
                    navic.attach(client, args.buf)
                end
            end,
        })

        vim.lsp.enable({
            "lua_ls",
            "pyright",
            "ts_ls",
            "html",
            "cssls",
            "jsonls",
        })

        vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
    end,
},
}
