local custom_theme_lualine = require'lualine.themes.iceberg_dark'

-- Change the background of lualine_c section for normal mode
custom_theme_lualine.normal.c.bg = 0

require('lualine').setup {
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    --lualine_c = { require("yaml_nvim").get_yaml_key_and_value },
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  }
}
