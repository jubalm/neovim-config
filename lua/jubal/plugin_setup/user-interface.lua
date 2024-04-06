return {
	-- Theme
	{
		'shaunsingh/nord.nvim',
		config = function()
			vim.g.nord_italic = false
			vim.g.nord_bold = false
			vim.g.nord_disable_background = true
			vim.g.nord_contrast = true
			vim.cmd('colorscheme nord')
		end
	},

	-- Statusbar details
	{
		'nvim-lualine/lualine.nvim',
		opts = {
			options = {
				icons_enabled = false,
				component_separators = '',
				section_separators = '',
			},
			sections = {
				lualine_a = { { 'mode', fmt = function(str) return str:sub(1, 1) end } },
				lualine_b = { 'branch' },
				lualine_c = { { 'filename', path = 1 }, 'diff', 'diagnostics' },
				lualine_x = { 'encoding' }
			},
		}
	},

	-- Show keyboard hints
	{
		'folke/which-key.nvim',
		opts = {}
	},

	-- Git Indicators
	{ 'tpope/vim-fugitive' },
	{ 'tpope/vim-rhubarb' },
	{
		'lewis6991/gitsigns.nvim',
		opts = {
			-- See `:help gitsigns.txt`
			signs = {
				add = { text = '+' },
				change = { text = '~' },
				delete = { text = '_' },
				topdelete = { text = '‾' },
				changedelete = { text = '~' },
			},
			on_attach = function(bufnr)
				vim.keymap.set('n', '<leader>gp', require('gitsigns').prev_hunk,
					{ buffer = bufnr, desc = '[G]o to P]revious Hunk' })
				vim.keymap.set('n', '<leader>gn', require('gitsigns').next_hunk,
					{ buffer = bufnr, desc = '[G]o to [N]ext Hunk' })
				vim.keymap.set('n', '<leader>h', require('gitsigns').preview_hunk,
					{ buffer = bufnr, desc = '[P]review [H]unk' })
			end,
		},
	},

	-- Show indentation guides
	{
		'lukas-reineke/indent-blankline.nvim',
		main = 'ibl',
		opts = {
			indent = {
				char = '┆',
			},
			scope = {
				show_start = false
			}
		},
	},
}
