-- Plugin Chat GPT, using Jackmort plugin
local conf = {
  chat = {
    keymaps = {
      draft_message = "<C-m>",
    },
  },
}

return {

  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function() require("chatgpt").setup(conf) end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
}
