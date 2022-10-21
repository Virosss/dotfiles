local status_ok, neonotes = pcall(require, "neonotes")
if not status_ok then
  return
end

neonotes.setup {}

vim.keymap.set("n", "cn", function()
  neonotes.createNote()
end)
