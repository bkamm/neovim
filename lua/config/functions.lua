-- Fluid Resize Mode (no plugins)
function Resize_loop()
  vim.cmd 'echo "RESIZE: h/l width, j/k height | H/J/K/L = x5 | q/Esc to quit"'
  local step_small, step_big = 2, 10
  while true do
    local c = vim.fn.getcharstr()
    if c == 'q' or c == '\027' then -- Esc
      vim.cmd 'echo ""'
      break
    elseif c == 'h' then
      vim.cmd('vertical resize -' .. step_small)
      vim.cmd('redraw')
    elseif c == 'l' then
      vim.cmd('vertical resize +' .. step_small)
      vim.cmd('redraw')
    elseif c == 'j' then
      vim.cmd('resize +' .. step_small)
      vim.cmd('redraw')
    elseif c == 'k' then
      vim.cmd('resize -' .. step_small)
      vim.cmd('redraw')
    elseif c == 'H' then
      vim.cmd('vertical resize -' .. step_big)
      vim.cmd('redraw')
    elseif c == 'L' then
      vim.cmd('vertical resize +' .. step_big)
      vim.cmd('redraw')
    elseif c == 'J' then
      vim.cmd('resize +' .. step_big)
      vim.cmd('redraw')
    elseif c == 'K' then
      vim.cmd('resize -' .. step_big)
      vim.cmd('redraw')
    end
  end
end
