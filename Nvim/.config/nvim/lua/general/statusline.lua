--  ╭──────────────────────────────────────────────────────────╮
--  │                   Status autocommands                    │
--  │          Credit: u/HarmonicAscendant on reddit           │
--  ╰──────────────────────────────────────────────────────────╯
--  TODO: Rewrite this at some point, its been so long since
--  I have looked at this.
local reset_group = vim.api.nvim_create_augroup('reset_group', {
  clear = false,
})

vim.api.nvim_create_autocmd({ 'BufEnter', 'CursorHold', 'CursorHoldI' }, {
  desc = 'word count for the statusline',
  pattern = { '*.md', '*.txt' },
  callback = function()
    local wc = vim.fn.wordcount().words
    if wc == 0 then
      vim.b.wordcount = ''
    elseif wc == 1 then
      vim.b.wordcount = wc .. ' word'
    else
      vim.b.wordcount = wc .. ' words'
    end
  end,
  group = init_group,
})

vim.api.nvim_create_autocmd({ 'BufEnter', 'CursorHold', 'FocusGained' }, {
  desc = 'git branch and LSP errors for the statusline',
  callback = function()
    local branch = vim.fn.system "git branch --show-current | tr -d '\n'"
    if string.sub(branch, 1, 16) == 'fatal: not a git' then
      vim.b.branch_name = ''
    else
      vim.b.branch_name = '  ' .. branch .. ' '
    end

    local num_errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })

    if num_errors > 0 then
      vim.b.errors = '  ' .. num_errors .. ' '
    else
      vim.b.errors = ''
    end
    local num_warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
    if num_warnings > 0 then
      vim.b.warnings = '  ' .. num_warnings .. ' '
    else
      vim.b.warnings = ''
    end
  end,
  group = init_group,
})

local function status_line()
  vim.cmd("hi ErrorNoUnderline gui=bold guifg=#EE6D85")
  local file_name = "%-.16t"
  local file_type = "%#ModeMsg#%y%#LineNr#"
  local terminalNumber = ' %{&ft == "toggleterm" ? "terminal (".b:toggle_number.")" : ""} '
  local right_align = "%="
  local spacer = "  "
  local pct_thru_file = "%5p%%"
  local gitbranch = '%#PMenuSel#%{get(b:, "branch_name", "")}%#LineNr#'
  local lsp_errors = '%#ErrorNoUnderline#%{get(b:, "errors", "")}%#LineNr#'
  local lsp_warnings = '%#WarningMsg#%{get(b:, "warnings", "")}%#LineNr#'
  local current_time = '%#WildMenu#%{strftime(" %H:%M ")}'

  return table.concat {
    gitbranch,
    terminalNumber,
    spacer,
    right_align,
    lsp_errors,
    lsp_warnings,
    file_type,
    spacer,
    current_time
  }
end

--  ╭──────────────────────────────────────────────────────────╮
--  │         Update statusline every second for clock         │
--  ╰──────────────────────────────────────────────────────────╯
vim.cmd [[call timer_start(1000, {-> execute(':let &stl=&stl')}, {'repeat': -1})]]

vim.opt.laststatus = 3
vim.opt.statusline = status_line()
