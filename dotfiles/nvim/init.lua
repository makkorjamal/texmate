require("config.lazy")
require("lazy").setup("plugins")
-- Enable Vimtex
vim.g.vimtex_view_method = 'zathura'  -- Change to your preferred PDF viewer

-- Set the compiler method
vim.g.vimtex_compiler_method = 'latexmk'

-- Configure latexmk options
vim.g.vimtex_compiler_latexmk = {
    build_dir = 'build',
    callback = 1,
    continuous = 1,
    executable = 'latexmk',
    options = {
        '-pdf',
        '-xelatex=' .. 'xelatex -interaction=nonstopmode',
    },
}
vim.opt.spell = true
vim.opt.spelllang = 'en_gb'
vim.cmd('colorscheme pablo')
-- Remap Ctrl + p to Tab in normal mode
vim.api.nvim_set_keymap('i', '<TAB>', 'coc#pum#visible() ? coc#pum#confirm() : "\\<C-g>u\\<TAB>"', { expr = true, silent = true })
require('lint').linters_by_ft = {
  markdown = {'tex'},
}
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint("lacheck")
  end,
})
