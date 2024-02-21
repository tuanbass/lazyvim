-- local Model = {
--   GPT_3_5_TURBO_16K = "gpt-3.5-turbo-16k",
--   GPT_3_5_TURBO = "gpt-3.5-turbo",
--   GPT_4 = "gpt-4",
-- }

-- Custom functions for commands
local CustomFunctions = {
  UnitTests = function(gp, params)
    local template = "I have the following code from {{filename}}:\n\n"
      .. "```{{filetype}}\n{{selection}}\n```\n\n"
      .. "Please respond by writing unit tests for the code above. Just write the code, no need explanation"
    local agent = gp.get_chat_agent()
    gp.Prompt(params, gp.Target.enew, nil, agent.command_model, template, gp.config.command_system_prompt)
  end,

  -- example of adding command which explains the selected code
  Explain = function(gp, params)
    local template = "I have the following code from {{filename}}:\n\n" .. "```{{filetype}}\n{{selection}}\n```\n\n" .. "Please respond by explaining the code above."
    local agent = gp.get_chat_agent()
    gp.Prompt(params, gp.Target.popup, nil, agent.command_model, template, gp.config.chat_system_prompt)
  end,

  -- example of usig enew as a function specifying type for the new buffer
  CodeReview = function(gp, params)
    -- local template = "I have the following code from {{filename}}:\n\n" .. "```{{filetype}}\n{{selection}}\n```\n\n" .. "Please analyze for code smells and suggest improvements."
    local template = "I have the following code from {{filename}}:\n\n" .. "```{{filetype}}\n{{selection}}\n```\n\n" .. "Please analyze for code smells "
    local agent = gp.get_chat_agent()
    gp.Prompt(params, gp.Target.enew("markdown"), nil, agent.command_model, template, gp.config.command_system_prompt)
  end,

  CallGraph = function(gp, params)
    local template = "I have the following code from {{filename}}:\n\n"
      .. "```{{filetype}}\n{{selection}}\n```\n\n"
      .. "Tell me function call graph from this code. Draw the graph only, no need explanation"
    local agent = gp.get_chat_agent()
    gp.Prompt(params, gp.Target.enew("markdown"), nil, agent.model, template, gp.config.command_system_prompt)
  end,

  Translate = function(gp, params)
    local template = "Transalate following test {{filename}}:\n\n" .. "```{{filetype}}\n{{selection}}\n```\n\n" .. params.args
    local agent = gp.get_chat_agent()
    gp.Prompt(params, gp.Target.enew("markdown"), nil, agent.model, template, gp.config.command_system_prompt)
  end,
}

-- -- configuration when call to chatgpt api
-- local conf = {
--   -- chat model used to generate chat content
--   chat_model = { model = Model.GPT_3_5_TURBO_16K, temperature = 1.1 },
--
--   -- model used to generate chat topics (topic: ?) header from chat content
--   chat_topic_gen_model = Model.GPT_3_5_TURBO_16K,
--
--   -- command config and templates bellow are used by commands like GpRewrite, GpEnew, etc.
--   command_model = { model = Model.GPT_3_5_TURBO_16K, temperature = 1.1 },
--   hooks = CustomFunctions,
-- }

-- define some shortcuts
local function define_shortcut()
  -- VISUAL mode mappings
  -- s, x, v modes are handled the same way by which_key
  require("which-key").register({
    -- ...
    ["<C-g>"] = {
      c = { ":<C-u>'<,'>GpChatNew<cr>", "New chat" },
      v = { ":<C-u>'<,'>GpChatPaste<cr>", "Paste Selection" },
      -- t = { ":<C-u>'<,'>GpChatToggle<cr>", "Visual Popup Chat" },

      -- r = { ":<C-u>'<,'>GpRewrite<cr>", "Rewrite" },
      a = { ":<C-u>'<,'>GpAppend<cr>", "Append" },
      -- b = { ":<C-u>'<,'>GpPrepend<cr>", "Prepend" },
      e = { ":<C-u>'<,'>GpEnew<cr>", "Enew" },
      p = { ":<C-u>'<,'>GpPopup<cr>", "Popup" },
      s = { "GpStop<cr>", "Stop" },
      t = { ":<C-u>'<,'>GpUnitTests<cr>", "Unit tests" },
      r = { ":<C-u>'<,'>GpCodeReview<cr>", "Code review" },
      x = { ":<C-u>'<,'>GpExplain<cr>", "Code Explain" },

      -- -- optional Whisper commands
      -- w = { ":<C-u>'<,'>GpWhisper<cr>", "Whisper" },
      -- R = { ":<C-u>'<,'>GpWhisperRewrite<cr>", "Whisper Visual Rewrite" },
      -- A = { ":<C-u>'<,'>GpWhisperAppend<cr>", "Whisper Visual Append" },
      -- B = { ":<C-u>'<,'>GpWhisperPrepend<cr>", "Whisper Visual Prepend" },
      -- E = { ":<C-u>'<,'>GpWhisperEnew<cr>", "Whisper Visual Enew" },
      -- P = { ":<C-u>'<,'>GpWhisperPopup<cr>", "Whisper Visual Popup" },
    },
    -- ...
  }, {
    mode = "v", -- VISUAL mode
    prefix = "",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = true,
  })

  -- NORMAL mode mappings
  require("which-key").register({
    -- ...
    ["<C-g>"] = {
      c = { "<cmd>GpChatNew<cr>", "New Chat" },
      -- t = { "<cmd>GpChatToggle<cr>", "Toggle Popup Chat" },
      f = { "<cmd>GpChatFinder<cr>", "Chat Finder" },

      -- r = { "<cmd>GpRewrite<cr>", "Rewrite" },
      a = { "<cmd>GpAppend<cr>", "Append" },
      -- b = { "<cmd>GpPrepend<cr>", "Prepend" },
      e = { "<cmd>GpEnew<cr>", "GPT new Buffer" },
      p = { "<cmd>GpPopup<cr>", "Popup" },
      s = { "<cmd>GpStop<cr>", "Stop" },
      i = { "<cmd>GpInspectPlugin<cr>", "Inspect" },
      ["<C-g>"] = { "<cmd>GpChatRespond<cr>", "Chat Respond" },

      -- -- optional Whisper commands
      -- w = { "<cmd>GpWhisper<cr>", "Whisper" },
      -- R = { "<cmd>GpWhisperRewrite<cr>", "Whisper Inline Rewrite" },
      -- A = { "<cmd>GpWhisperAppend<cr>", "Whisper Append" },
      -- B = { "<cmd>GpWhisperPrepend<cr>", "Whisper Prepend" },
      -- E = { "<cmd>GpWhisperEnew<cr>", "Whisper Enew" },
      -- P = { "<cmd>GpWhisperPopup<cr>", "Whisper Popup" },
    },
    -- ...
  }, {
    mode = "n", -- NORMAL mode
    prefix = "",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = true,
  })

  -- INSERT mode mappings
  require("which-key").register({
    -- ...
    ["<C-g>"] = {
      c = { "<cmd>GpChatNew<cr>", "New Chat" },
      t = { "<cmd>GpChatToggle<cr>", "Toggle Popup Chat" },
      f = { "<cmd>GpChatFinder<cr>", "Chat Finder" },

      r = { "<cmd>GpRewrite<cr>", "Inline Rewrite" },
      a = { "<cmd>GpAppend<cr>", "Append" },
      b = { "<cmd>GpPrepend<cr>", "Prepend" },
      e = { "<cmd>GpEnew<cr>", "Enew" },
      p = { "<cmd>GpPopup<cr>", "Popup" },
      s = { "<cmd>GpStop<cr>", "Stop" },

      -- optional Whisper commands
      w = { "<cmd>GpWhisper<cr>", "Whisper" },
      R = { "<cmd>GpWhisperRewrite<cr>", "Whisper Inline Rewrite" },
      A = { "<cmd>GpWhisperAppend<cr>", "Whisper Append" },
      B = { "<cmd>GpWhisperPrepend<cr>", "Whisper Prepend" },
      E = { "<cmd>GpWhisperEnew<cr>", "Whisper Enew" },
      P = { "<cmd>GpWhisperPopup<cr>", "Whisper Popup" },
    },
    -- ...
  }, {
    mode = "i", -- INSERT mode
    prefix = "",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = true,
  })
end

return {
  -- lazy.nvim
  {
    "robitx/gp.nvim",
    config = function()
      require("gp").setup(conf)
      define_shortcut()

      -- shortcuts might be setup here (see Usage > Shortcuts in Readme)
    end,
  },
}
