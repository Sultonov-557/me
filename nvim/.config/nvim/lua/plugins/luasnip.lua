return {
	"L3MON4D3/LuaSnip",
	config = function()
		print("LuaSnip config running ✅")

		local ls = require("luasnip")

		-- load global snippets
		require("luasnip.loaders.from_lua").lazy_load()

		-- load project-local snippets
		local function load_project_snippets()
			local project_snippets = vim.fn.getcwd() .. "/.nvim/snippets"
			if vim.fn.isdirectory(project_snippets) == 1 then
				print("LuaSnip: loading " .. project_snippets)
				require("luasnip.loaders.from_lua").load({ paths = project_snippets })
			else
				print("LuaSnip: no snippets in " .. project_snippets)
			end
		end

		load_project_snippets()
		vim.api.nvim_create_autocmd("DirChanged", { callback = load_project_snippets })
	end,
}
