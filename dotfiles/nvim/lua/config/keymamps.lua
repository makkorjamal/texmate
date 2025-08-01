vim.keymap.set(
  "n",
  "<leader>öt", -- Or whatever you may want to use as a keymap
  ":TeXpresso %<CR>",
  vim.tbl_extend("force", opts, { desc = "Run TeXpresso on current file" })
)
