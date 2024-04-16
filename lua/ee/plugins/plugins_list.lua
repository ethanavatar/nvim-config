local plugins = {}

local function add(name)
    local plugin = require('ee.plugins.' .. name)
    table.insert(plugins, plugin)
end

add('theme')
add('zen')

add('sleuth')
add('autopairs')
add('lualine')
add('indent-blankline')
add('whichkey')
add('harpoon')

add('file_navigation')
add('telescope')

add('treesitter')
add('completion')

return plugins
