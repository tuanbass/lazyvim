function debug_hydra()
	local Hydra = require("hydra")
	local hint = [[
	   _b_: Toggle breakpoint ^^^^^^ _r_: Start/Continue ^^^^^^ _o_: Step Over ^^^^^^ _i_: Step Into ^^^^^^ _s_: Stop^^^^^^  _x_: exit
     ]]
	Hydra({
		name = "Debug:   ",
		hint = hint,
		config = {
			hint = {
				type = "window", -- only window works
			},
			color = "pink",
		},
		mode = "n",
		body = "<leader>dd",
		heads = {

			-- some shortcut doesnot use function key
			{ "o", function() require("dap").step_over() end, { desc = "Step Over" } }, -- Step Over
			{ "i", function() require("dap").step_into() end, { desc = "Step Into" } }, -- Step Into
			{ "b", function() require("dap").toggle_breakpoint() end, { desc = "Toggle breakpoint" } }, -- Toggle breakpoint
			{ "r", function() require("dap").continue() end, { desc = "Start/Continue" } }, -- start/continue
			{ "s", function() require("dap").terminate() end, { desc = "Terminate" } }, -- start/continue
			{ "<F9>", function() require("dap").toggle_breakpoint() end, { desc = "Toggle breakpoint" } }, -- Toggle breakpoint
			-- { "<F21>", "<leader>dB", { desc = "Conditional breakpoint" } }, -- <S-F9>Conditional breakpoint
			{ "<F5>", function() require("dap").continue() end, { desc = "Start/Continue" } }, -- start/continue
			{ "<F17>", function() require("dap").run_to_cursor() end, { desc = "Run to Cursor(S-F5)" } }, -- <S-F5>: Run to cursor
			{ "<F10>", function() require("dap").step_over() end, { desc = "Step Over" } }, -- Step Over
			{ "<F11>", function() require("dap").step_into() end, { desc = "Step Into" } }, -- Step Into
			{ "<F12>", function() require("dap").step_out() end, { desc = "Step Out" } }, -- Step Out
			{ "x", nil, { desc = "exit", exit = true } },
		},
	})

	-- register the short cut in which-key
	local wk = require("which-key")
	wk.register({ d = { name = "Debug hydra" } }, { prefix = "<leader>d" })
end

return {
	{ import = "lazyvim.plugins.extras.dap.core" },
	{ import = "lazyvim.plugins.extras.dap.nlua" },
	{
		"anuvyklack/hydra.nvim",
		config = function() debug_hydra() end,
		-- opts = function(_, opts) end,
	},
}

-- NOTES--
-- For typescript/js, to be able to use Attach mode, need to start with `node --inspect-brk` or `export NODE_OPTIONS="--inspect-brk"` (ts-node)
