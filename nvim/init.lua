if vim.loader then
  vim.loader.enable()
end

_G.dd = function(...)
  require("util.debug").dump(...)
end
vim.print = _G.dd

vim.filetype.add({
  extension = {
    vert = "glsl",
    tesc = "glsl",
    tese = "glsl",
    frag = "glsl",
    geom = "glsl",
    comp = "glsl",
  },
})

require("config.lazy")

-- :delmarks is the command to delete marks.
-- ! specifies that all marks (both lowercase and uppercase) will be deleted.
-- :delmarks!
