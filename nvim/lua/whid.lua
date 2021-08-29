-- First plugin to do things

local api = vim.api
local buf, win

local function open_window()
  --  Create a new empty buffer that won't be listed (help buflisted) and wipe 
  --  it out from the list of buffers when it's closed.
  buf = api.nvim_create_buf(false, true)
  api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')

  --  Getting nvim's dimension
  local width  = api.nvim_get_option('columns')
  local height = api.nvim_get_option('lines')

  --  Calculate the size of the new windows
  local w_height = math.ceil(height * 0.8 - 4)
  local w_width  = math.ceil(width * 0.8)

  --  Calculate window's starting point
  local s_row = math.ceil((height - w_height) / 2 - 1)
  local s_col = math.ceil((width  - w_height) / 2)

  --  Finally setting the options
  local options = {
    style = "minimal",
    relative = "editor",
    width = w_width,
    height = w_height,
    row = s_row,
    col = s_col
  }

  --  Open the window with that buffer attached
  win = api.nvim_create_win(buf, true, options)
end
