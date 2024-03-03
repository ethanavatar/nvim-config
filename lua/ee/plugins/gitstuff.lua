return {
    'tpope/vim-fugitive',
    event = 'BufReadPre',
    dependencies = {
        'tpope/vim-rhubarb',
        {
            'lewis6991/gitsigns.nvim',
            opts = {
                signs = {
                    add = { text = '+' },
                    change = { text = '~' },
                    delete = { text = '_' },
                    topdelete = { text = '‾' },
                    changedelete = { text = '~' },
                },
            },
        },
    },
}
