return {
    "let-def/texpresso.vim",
    ft = "tex", -- load only for TeX files for efficiency
    config = function()
      -- Set the custom path to your texpresso binary
      require("texpresso").texpresso_path = "/usr/bin/texpresso"
    end,
  "folke/neodev.nvim",
  "mfussenegger/nvim-lint",
  "neoclide/coc.nvim",
  "folke/which-key.nvim",
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  "lervag/vimtex",
  lazy = false, -- lazy-loading will disable inverse search
  config = function()
    vim.g.vimtex_view_method = "sioyek"
    vim.g.vimtex_compiler_latexmk = {
      aux_dir = "./.latexmk/aux",
      out_dir = "./.latexmk/out",
    }
  end,
  keys = {
    { "<localLeader>l", "", desc = "+vimtex" },
  },
}
