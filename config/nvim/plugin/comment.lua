--  PluginName: Comment.nvim
--  Github: https://github.com/numToStr/Comment.nvim

local ready, comment = pcall(require, "Comment")
if not ready then
  return
end

comment.setup {
  ---Add a space b/w comment and the line
  padding = true,
  ---Whether the cursor should stay at its position
  sticky = true,
  ---Lines to be ignored while comment/uncomment.
  ignore = nil,

  opleader = {
    line = "cc",
    block = "cb",
  },

  mappings = {
    basic = true,
    extra = false,
    extended = false,
  },

  ---Pre-hook, called before commenting the line
  pre_hook = nil,

  ---Post-hook, called after commenting is done
  post_hook = nil,
}
