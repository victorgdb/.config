return {
  {
    'microsoft/vscode-js-debug',
    build = 'npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out',
  },
  {
    'mxsdev/nvim-dap-vscode-js',
    config = function()
      require('dap-vscode-js').setup {
        -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
        debugger_path = vim.fn.stdpath 'data' .. '/lazy/vscode-js-debug',
        -- debugger_cmd = { "extension" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
        adapters = {
          'chrome',
          'pwa-node',
          'pwa-chrome',
          'pwa-msedge',
          'node-terminal',
          'pwa-extensionHost',
          'chrome',
        }, -- which adapters to register in nvim-dap
        -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
        -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
        -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
      }
    end,
  },
  {
    'mfussenegger/nvim-dap',
    config = function()
      local js_based_languages = { 'typescript', 'javascript', 'typescriptreact' }
      for _, language in ipairs(js_based_languages) do
        require('dap').configurations[language] = {
          {
            type = 'pwa-node',
            request = 'launch',
            name = 'Debug Nest Framework',
            runtimeExecutable = 'npm',
            runtimeArgs = { 'run', 'start:debug', '--', '--inspect-brk' },
            autoAttachChildProcesses = true,
            restart = true,
            sourceMaps = true,
            stopOnEntry = false,
	    cwd = vim.fn.getcwd(),
            console = 'integratedTerminal',
          },
        }
      end
    end,
  },
  {
    'rcarriga/nvim-dap-ui',
    dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
    config = function()
      require('dapui').setup()

      local dap, dapui = require 'dap', require 'dapui'

      dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open {}
      end
      -- dap.listeners.before.event_terminated['dapui_config'] = function()
      --   dapui.close {}
      -- end
      -- dap.listeners.before.event_exited['dapui_config'] = function()
      --   dapui.close {}
      -- end

      vim.keymap.set('n', '<leader>ui', require('dapui').toggle)
    end,
  },
}
