-- To enable Sonokai theme you must add in try:
-- let g:sonokai_style = 'andromeda'
-- let g:sonokai_better_performance = 1 
-- colorscheme sonokai
vim.cmd [[
try
  colorscheme nightfly
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
