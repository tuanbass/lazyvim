return {
  { -- fuzzy search
    -- NOTES: it works only for grep_string and find_files, anf not for live_grep (as live_grep use ag directly, not use telescope sorter )
    -- hint: live_grep a word, then <C-space> to switch to grep_string, then we can use fzf sorter
    "nvim-telescope/telescope-fzf-native.nvim",
    -- cmd = "Telescope ",
    dependencies = "telescope.nvim",
    config = function()
      require("telescope").load_extension("fzf")
    end,
    lazy = false,
    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    -- TODO: Currently, sometime you need to go to /.local/share/nvim/lazy/telescope-fzf-native.nvim and manual run make.
    -- Need to find a way to run make automatically. Dont know why build command not work}
  },
}
