return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"nvim-neotest/nvim-nio",
			"williamboman/mason.nvim",
		},
		config = function()
			local dap = require("dap")
			local ui = require("dapui")

			require("dapui").setup()
			require("nvim-dap-virtual-text").setup({})

			require("dap").adapters["pwa-node"] = {
				type = "server",
				host = "localhost",
				port = 9229,
				executable = {
					command = "node",
					-- 💀 Make sure to update this path to point to your installation
					args = {
						"/Users/josue.barreto/.local/share/nvim/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
						9229,
					},
				},
			}

			require("dap").configurations.javascript = {
				{
					type = "pwa-node",
					request = "attach",
					port = 9229,
					name = "server",
					address = "127.0.0.1",
					localRoot = "${workspaceFolder}",
					skipFiles = { "<node_internals>/**" },
				},
			}

			vim.keymap.set("n", "<space>b", dap.toggle_breakpoint)
			vim.keymap.set("n", "<space>gb", dap.run_to_cursor)

			-- Eval var under cursor
			vim.keymap.set("n", "<space>?", function()
				require("dapui").eval(nil, { enter = true })
			end)

			vim.keymap.set("n", "<leader>1", dap.continue)
			vim.keymap.set("n", "<leader>2", dap.step_into)
			vim.keymap.set("n", "<F3>", dap.step_over)
			vim.keymap.set("n", "<F4>", dap.step_out)
			vim.keymap.set("n", "<F5>", dap.step_back)
			vim.keymap.set("n", "<F13>", dap.restart)

			dap.listeners.before.attach.dapui_config = function()
				ui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				ui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				ui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				ui.close()
			end
		end,
	},
}
