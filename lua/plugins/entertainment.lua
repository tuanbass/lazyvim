local disabled = true
if disabled then return {} end

return {
	{
		"stsewd/spotify.nvim",
		build = function()
			vim.cmd([[
        :UpdateRemotePlugins <cr>
      ]])
		end,
		keys = {
			{ "<leader>en", ":Spotify next<cr>", desc = "SpotNext" },
			{ "<leader>ep", ":Spotify next<cr>", desc = "SpotPrev" },
			{ "<leader>es", ":Spotify play/pause<cr>", desc = "SpotPlay/Pause" },
			{ "<leader>eu", ":Spotify status<cr>", desc = "SpotStatus" },
			{ "<leader>eS", ":Spotify show<cr>", desc = "SpotShow" },
		},
	},
}
