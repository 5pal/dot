require("bufferline").setup({
  options = {
    close_command = function(n)
      Snacks.bufdelete.delete()
    end,
    right_mouse_command = function(n)
      Snacks.bufdelete.delete()
    end,
    diagnostics = "nvim_lsp",
    mode = "tabs",
    -- separator_style = "slant",
    show_buffer_close_icons = false,
    show_close_icon = false,
    buffer_close_icon = "",
    modified_icon = "",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    offsets = {
      {
        highlight = "Directory",
        text_align = "left",
      },
    },
  },
})
