-- TODO: Figure out how to make this work with the plugin system
local resize_ratio = 0.9 -- 0.62 -- golden ratio

_G.toggle_resize = function()
  if vim.t.resized == vim.api.nvim_get_current_buf() then
    vim.cmd(vim.t.restore)
    vim.cmd("set cmdheight=1")
    vim.t.resized = nil
  else
    local win_height = math.floor(vim.o.lines * resize_ratio) - vim.o.cmdheight
    local win_width = math.floor(vim.o.columns * resize_ratio)
    vim.t.restore = "resize " .. vim.fn.winheight(0) .. " | vertical resize " .. vim.fn.winwidth(0)
    vim.cmd("resize " .. win_height)
    vim.cmd("vertical resize " .. win_width)
    vim.cmd("set cmdheight=1")
    vim.t.resized = vim.api.nvim_get_current_buf()
  end
end

-- Map Ctrl-w f to toggle fullscreen
vim.api.nvim_set_keymap('n', '<C-w>f', ':lua toggle_resize()<CR>', { noremap = true, silent = true })
