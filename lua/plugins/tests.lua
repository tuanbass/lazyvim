vim.g.neo_test_capture_console = false

local cmd_list = {
  {
    "NeotestToggleCaptureConsole",
    function()
      vim.g.neo_test_capture_console = not vim.g.neo_test_capture_console
      vim.notify("Neotest Capture Console: " .. (vim.g.neo_test_capture_console and "on" or "off") .. "\nNotes: it works now for rust only !!!")
    end,
  },
}
require("utils.cmd").createCommand(cmd_list)
return {
  { import = "lazyvim.plugins.extras.test.core" },
  { "nvim-neotest/neotest-plenary" },
  { "nvim-neotest/neotest-jest" },
  { "rouge8/neotest-rust" },
  {
    "nvim-neotest/neotest",
    config = function()
      -- print(vim.inspect(o))
      require("neotest").setup({
        adapters = {
          require("neotest-plenary"),
          require("neotest-jest"),
          require("neotest-rust")({
            -- neotest-rust require `cargo nextest` installed
            args = function()
              local res = {}
              if vim.g.neo_test_capture_console then table.insert(res, "--no-capture") end
              return res
            end,
          }),
        },
      })
    end,
    -- opts = { adapters = { "neotest-plenary", "neotest-jest", "neotest-rust" } },
  },
}
