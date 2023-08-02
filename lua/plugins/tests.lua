return {
	{ import = "lazyvim.plugins.extras.test.core" },
	{ "nvim-neotest/neotest-plenary" },
	{ "nvim-neotest/neotest-jest" },
	{
		"nvim-neotest/neotest",
		opts = { adapters = { "neotest-plenary", "neotest-jest" } },
	},
}
