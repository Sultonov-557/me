return {
	"L3MON4D3/LuaSnip",
	config = function()
		local ls = require("luasnip")

		-- load global snippets
		require("luasnip.loaders.from_lua").lazy_load()

		-- try to load project-local snippets
		local project_snippets = vim.fn.getcwd() .. "/.nvim/snippets"
		if vim.fn.isdirectory(project_snippets) == 1 then
			require("luasnip.loaders.from_lua").lazy_load({ paths = project_snippets })
		end
	end,
}
