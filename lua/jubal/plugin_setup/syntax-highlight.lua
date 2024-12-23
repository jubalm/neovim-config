return {
	'nvim-treesitter/nvim-treesitter',
	dependencies = {
		'nvim-treesitter/nvim-treesitter-textobjects',
		'windwp/nvim-ts-autotag'
	},
	build = ':TSUpdate',
	config = function()
		-- See `:help nvim-treesitter`
		require 'nvim-treesitter.configs'.setup {
			modules = {},
			sync_install = false,
			ignore_install = {},
			ensure_installed = { "css", "javascript", "typescript", "tsx", "json", "html", "bash", "lua" },
			auto_install = true,
			autotag = { enable = true },
			highlight = {
				enable = true,
				disable = { "yaml" }
			},
			indent = { enable = true },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = false,
					node_incremental = 'v',
					scope_incremental = false,
					node_decremental = 'V',
				},
			},
			playground = {
				enable = true
			},
			textobjects = {
				select = {
					enable = true,
					lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
					keymaps = {
						-- You can use the capture groups defined in textobjects.scm
						['aa'] = '@parameter.outer',
						['ia'] = '@parameter.inner',
						['af'] = '@function.outer',
						['if'] = '@function.inner',
						['ac'] = '@class.outer',
						['ic'] = '@class.inner',
					},
				},
				move = {
					enable = true,
					set_jumps = true, -- whether to set jumps in the jumplist
					goto_next_start = {
						[']m'] = '@function.outer',
						[']]'] = '@class.outer',
					},
					goto_next_end = {
						[']M'] = '@function.outer',
						[']['] = '@class.outer',
					},
					goto_previous_start = {
						['[m'] = '@function.outer',
						['[['] = '@class.outer',
					},
					goto_previous_end = {
						['[M'] = '@function.outer',
						['[]'] = '@class.outer',
					},
				},
				swap = {
					enable = true,
					swap_next = {
						['<leader>a'] = '@parameter.inner',
					},
					swap_previous = {
						['<leader>A'] = '@parameter.inner',
					},
				},
			},
		}

		-- Diagnostic keymaps
		vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
		vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
		vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
		vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
	end
}
