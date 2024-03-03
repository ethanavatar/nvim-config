local colors = {
    bg = 'None', -- '#3c3836',
    fg = '#ebdbb2',
    yellow = '#fabd2f',
    green = '#b8bb26',
    blue = '#458588',
    red = '#cc241d',
    aqua = '#689d6a',
}

local conditions = {
    buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
    end,
    hide_in_width = function()
        return vim.fn.winwidth(0) > 80
    end,
    check_git_workspace = function()
        local filepath = vim.fn.expand('%:p:h')
        local gitdir = vim.fn.finddir('.git', filepath .. ';')
        return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
}

local function layout(config)
    local function ins_left(component)
        table.insert(config.sections.lualine_c, component)
    end

    local function ins_right(component)
        table.insert(config.sections.lualine_x, component)
    end

    ins_left({
        'branch',
        icon = '',
        color = { fg = colors.fg, gui = 'bold' },
    })

    ins_left({
        'filename',
        cond = conditions.buffer_not_empty,
        color = { fg = colors.fg, gui = 'bold' },
    })

    ins_left({
        'diff',
        symbols = { added = '+', modified = '~', removed = '-' },
        diff_color = {
            added = { fg = colors.green },
            modified = { fg = colors.blue },
            removed = { fg = colors.red },
        },
    })

    ins_left({
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        symbols = { error = ' ', warn = ' ', info = ' ' },
        diagnostics_color = {
            color_error = { fg = colors.red },
            color_warn = { fg = colors.yellow },
            color_info = { fg = colors.aqua },
        },
    })

    ins_left({
        function()
            return '%='
        end,
    })

    ins_right({ 'progress', color = { fg = colors.fg, gui = 'bold' } })

    ins_right({ 'location' })
end

local config = {
    options = {
        component_separators = '',
        section_separators = '',
        theme = {
            normal = { c = { fg = colors.fg, bg = colors.bg } },
            inactive = { c = { fg = colors.fg, bg = colors.bg } },
        },
    },
    sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
    },
}
layout(config)

return {
    'nvim-lualine/lualine.nvim',
    event = 'UIEnter',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = config,
}
