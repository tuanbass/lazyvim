local dap = require("dap")

local Preset = {
	WITH_FN = {
		hint = [[
  _<F9>_ : Toggle breakpoint
  _<F5>_ : Start/Continue
  _<F10>_: Step Over
  _<F11>_: Step Into
  _<F12>_: Step Out
  _<F17>_: Run2Cursor(S-F5)
  _d_    : Show Hydra
  _X_    : exit
    ]],
		heads = {
			-- some shortcut use function key
			{ "<F9>", function() dap.toggle_breakpoint() end, { desc = "Toggle breakpoint" } }, -- Toggle breakpoint
			-- { "<F21>", "<leader>dB", { desc = "Conditional breakpoint" } }, -- <S-F9>Conditional breakpoint
			{ "<F5>", function() dap.continue() end, { desc = "Start/Continue" } }, -- start/continue
			{ "<F17>", function() dap.run_to_cursor() end, { desc = "Run to Cursor(S-F5)" } }, -- <S-F5>: Run to cursor
			{ "<F10>", function() dap.step_over() end, { desc = "Step Over" } }, -- Step Over
			{ "<F11>", function() dap.step_into() end, { desc = "Step Into" } }, -- Step Into
			{ "<F12>", function() dap.step_out() end, { desc = "Step Out" } }, -- Step Out
			{ "d", function() end, { desc = "Show Hydra" } }, -- start/continue
			{ "X", nil, { desc = "exit", exit = true } },
		},
	},
	NO_FN = {
		hint = [[
  _B_: Toggle breakpoint
  _R_: Start/Continue
  _O_: Step Over
  _I_: Step Into
  _S_: Stop
  _d_: Show Hydra
  _X_: exit
    ]],
		heads = {
			{ "O", function() dap.step_over() end, { desc = "Step Over" } }, -- Step Over
			{ "I", function() dap.step_into() end, { desc = "Step Into" } }, -- Step Into
			{ "B", function() dap.toggle_breakpoint() end, { desc = "Toggle breakpoint" } }, -- Toggle breakpoint
			{ "R", function() dap.continue() end, { desc = "Start/Continue" } }, -- start/continue
			{ "S", function() dap.terminate() end, { desc = "Terminate" } }, -- start/continue
			{ "d", function() end, { desc = "Show Hydra" } }, -- start/continue
			{ "X", nil, { desc = "exit", exit = true } },
		},
	},
}

local function show_hydra()
	local Hydra = require("hydra")
	local preset = Preset.NO_FN
	Hydra({
		name = "Debug:   ",
		hint = preset.hint,
		config = {
			hint = {
				type = "window", -- only window works
				position = "middle-right",
			},
			color = "pink", -- Hydra "color" , define type of hydra. Not confuse as the dispaly color
		},
		mode = "n",
		body = "<leader>dd",
		heads = preset.heads,
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
		config = function() show_hydra() end,
		-- opts = function(_, opts) end,
		keys = { { "<leader>das", function() require("osv").stop() end, desc = "Stop Lua server" } },
	},
}

-- NOTES--
-- For typescript/js, to be able to use Attach mode, need to start with `node --inspect-brk` or `export NODE_OPTIONS="--inspect-brk"` (ts-node)
