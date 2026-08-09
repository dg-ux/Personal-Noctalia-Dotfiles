 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#19120d',
    base01 = '#261e19',
    base02 = '#312823',
    base03 = '#9f8d83',
    base04 = '#d7c3b8',
    base05 = '#f0dfd7',
    base06 = '#f0dfd7',
    base07 = '#f0dfd7',
    base08 = '#ffb4ab',
    base09 = '#caca93',
    base0A = '#e5bfa8',
    base0B = '#ffb787',
    base0C = '#caca93',
    base0D = '#ffb787',
    base0E = '#e5bfa8',
    base0F = '#93000a',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#f0dfd7',          bg = '#19120d' })
  hi('TelescopeBorder',         { fg = '#9f8d83',             bg = '#19120d' })
  hi('TelescopePromptNormal',   { fg = '#f0dfd7',          bg = '#19120d' })
  hi('TelescopePromptBorder',   { fg = '#9f8d83',             bg = '#19120d' })
  hi('TelescopePromptPrefix',   { fg = '#ffb787',             bg = '#19120d' })
  hi('TelescopePromptCounter',  { fg = '#d7c3b8',  bg = '#19120d' })
  hi('TelescopePromptTitle',    { fg = '#19120d',             bg = '#ffb787' })
  hi('TelescopePreviewTitle',   { fg = '#19120d',             bg = '#e5bfa8' })
  hi('TelescopeResultsTitle',   { fg = '#19120d',             bg = '#caca93' })
  hi('TelescopeSelection',      { fg = '#f0dfd7',          bg = '#312823' })
  hi('TelescopeSelectionCaret', { fg = '#ffb787',             bg = '#312823' })
  hi('TelescopeMatching',       { fg = '#ffb787',             bold = true })
end

 -- Register a signal handler for SIGUSR1 (matugen updates)
 local signal = vim.uv.new_signal()
 signal:start(
   'sigusr1',
   vim.schedule_wrap(function()
     package.loaded['matugen'] = nil
     require('matugen').setup()
   end)
 )

 return M
