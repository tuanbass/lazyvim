return {
	{
		"TaDaa/vimade",
		config = function(plugin)
			vim.g.vimade = {
				basegroups = {
					-- "Folded",
					-- "Search",
					-- "SignColumn",
					-- -- "LineNr",
					-- -- "CursorLine",
					-- -- "CursorLineNr",
					-- "DiffAdd",
					-- "DiffChange",
					-- "DiffDelete",
					-- "DiffText",
					-- "FoldColumn",
					-- "Whitespace",
					-- "NonText",
					-- "SpecialKey",
					-- "Conceal",
					-- "EndOfBuffer",
				},
			}
		end,
	},
	{
		"folke/zen-mode.nvim",
		opts = {
			window = {
				width = 180,
			},
		},
		keys = { { "<leader>vz", "<cmd>ZenMode<cr>", desc = "Zen mode" } },
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
	},
	{
		"akinsho/bufferline.nvim",
		opts = {
			options = {
				always_show_bufferline = true,
				numbers = function(opts) return string.format("%s", opts.id) end,
			}, -- always show tabs, event if there is only one tab
		},
	},
	{
		-- asscociate buffer to tab
		"tiagovla/scope.nvim",
		lazy = false,
		config = function() require("scope").setup() end,
		keys = { { "<leader>fB", "<cmd>Telescope scope buffers<cr>", desc = "All buffers" } },
	},
	{
		"folke/edgy.nvim",
		opts = {
			animate = {
				enabled = false,
			},
		},
	},
	{
		"goolord/alpha-nvim",
		opts = function()
			local dashboard = require("alpha.themes.dashboard")
			local logo = [[

                          ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
                          ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
                          ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
                          ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
                          ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
                          ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝

      ████████╗██╗   ██╗ █████╗ ███╗   ██╗██████╗  █████╗ ███████╗███████╗    ██╗██████╗ ███████╗
      ╚══██╔══╝██║   ██║██╔══██╗████╗  ██║██╔══██╗██╔══██╗██╔════╝██╔════╝    ██║██╔══██╗██╔════╝
         ██║   ██║   ██║███████║██╔██╗ ██║██████╔╝███████║███████╗███████╗    ██║██║  ██║█████╗
         ██║   ██║   ██║██╔══██║██║╚██╗██║██╔══██╗██╔══██║╚════██║╚════██║    ██║██║  ██║██╔══╝
         ██║   ╚██████╔╝██║  ██║██║ ╚████║██████╔╝██║  ██║███████║███████║    ██║██████╔╝███████╗
         ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝    ╚═╝╚═════╝ ╚══════╝

                                                                            Powered by LazyVim

      ]]

			dashboard.section.header.val = vim.split(logo, "\n")
			dashboard.section.buttons.val = {
				dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
				dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
				dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
				dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
				dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
				dashboard.button("s", " " .. " Restore Session", [[:lua require("persistence").load() <cr>]]),
				dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
				dashboard.button("q", " " .. " Quit", ":qa<CR>"),
			}
			for _, button in ipairs(dashboard.section.buttons.val) do
				button.opts.hl = "AlphaButtons"
				button.opts.hl_shortcut = "AlphaShortcut"
			end
			dashboard.section.header.opts.hl = "AlphaHeader"
			dashboard.section.buttons.opts.hl = "AlphaButtons"
			dashboard.section.footer.opts.hl = "AlphaFooter"
			dashboard.opts.layout[1].val = 8
			return dashboard
		end,
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			lsp = { signature = { enabled = false } },
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = false, -- use my own definition of long message
				inc_rename = true,
			},
			cmdline = {
				view = "cmdline_popup",
			},

			views = {
				cmdline_popup = {
					position = {
						row = 25,
						col = "50%",
					},
				},
			},

			routes = { -- routes define how a message in a type display in a specific view
				{
					-- long message shoud go to split
					filter = { min_height = 5 },
					view = "split",
					-- also some filter conditin: "event", "kind" ...
					-- also use "redirect"
				},
				{
					-- writen message should go to mini for not annoy
					filter = {
						event = "msg_show",
						kind = "",
						find = "written",
					},
					view = "mini",
				},
			},
		},
	},
}
