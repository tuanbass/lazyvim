return {
  {
    "nvim-telescope/telescope.nvim",
  },
  {
    -- force all select action in nvim to use telescope
    "nvim-telescope/telescope-ui-select.nvim",
    -- cmd = "Telescope ",
    event = "VeryLazy",
    dependencies = "telescope.nvim",
    config = function()
      require("telescope").load_extension("ui-select")
    end,
  },
  { -- fuzzy search
    -- NOTES: it works only for grep_string and find_files, anf not for live_grep (as live_grep use ag directly, not use telescope sorter )
    -- hint: live_grep a word, then <C-space> to switch to grep_string, then we can use fzf sorter
    "nvim-telescope/telescope-fzf-native.nvim",
    -- cmd = "Telescope ",
    dependencies = "telescope.nvim",
    event = "VeryLazy",
    config = function()
      require("telescope").load_extension("fzf")
    end,
    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    -- TODO: Currently, sometime you need to go to /.local/share/nvim/lazy/telescope-fzf-native.nvim and manual run make.
    -- Need to find a way to run make automatically. Dont know why build command not work}
    keys = { { "<leader>se", "<cmd>Telescope sessions_picker<cr>", desc = "sEssion" } },
  },

  -- {
  --   "cljoly/telescope-repo.nvim",
  --   config = function(p)
  --     require("telescope").setup({
  --       extensions = {
  --         repo = {
  --           list = {
  --             fd_opts = {
  --               "--ignore-file=noindex",
  --             },
  --             search_dirs = {
  --               "/src",
  --               " ~/.config/nvim_editions",
  --             },
  --           },
  --         },
  --       },
  --     })
  --     require("telescope").load_extension("repo")
  --   end,
  -- },
  {
    -- Projects finder
    -- Prefer manually add project ("c" in normal mode) than auto detect like telescope-repo
    "nvim-telescope/telescope-project.nvim",
    config = function()
      require("telescope").load_extension("project")
    end,

    keys = { { "<leader>fp", ":Telescope project<CR>", desc = "Projects" } },
  },
}
