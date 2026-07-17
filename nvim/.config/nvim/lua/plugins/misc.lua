-- Standalone plugins with less than 10 lines of config go here
return {
  {
    -- Tmux & split window navigation
    'christoomey/vim-tmux-navigator',
  },
  {
    -- Detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',
  },
  {
    -- Powerful Git integration for Vim
    'tpope/vim-fugitive',
  },
  {
    -- Write Session.vim automatically so tmux-resurrect can restore Neovim state
    'tpope/vim-obsession',
    lazy = false,
    init = function()
      vim.api.nvim_create_autocmd('VimEnter', {
        callback = function()
          if vim.env.TMUX and vim.v.this_session == '' then
            if vim.fn.filereadable('Session.vim') == 1 then
              vim.cmd 'silent! source Session.vim'
            end

            vim.cmd 'silent! Obsession Session.vim'
          end
        end,
      })
    end,
  },
  {
    -- GitHub integration for vim-fugitive
    'tpope/vim-rhubarb',
  },
  {
    -- Hints keybinds
    'folke/which-key.nvim',
  },
  {
    -- Autoclose parentheses, brackets, quotes, etc.
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
    opts = {},
  },
  {
    -- Highlight todo, notes, etc in comments
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
  {
    -- High-performance color highlighter
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  },
  {
    'stevearc/dressing.nvim',
    event = 'VeryLazy',
  },
}
