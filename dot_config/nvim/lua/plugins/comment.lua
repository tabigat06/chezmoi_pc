return {
  "numToStr/Comment.nvim",
  opts = {},
  keys = {
    {
		"<M-3>",
		function()
			require("Comment.api").toggle.linewise.current()
		end,
		mode = { "n", "i"},
		desc = "Toggle comment",
    },
	{
		"<M-3>",
		"gc",
		mode = "x",
		remap = true,
		desc = "Toggle comment selection",
	},
  },
}

