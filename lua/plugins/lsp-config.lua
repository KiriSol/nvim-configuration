return {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
        local servers = { "pyright", "lua_ls", "ruff", "jsonls" }
        vim.lsp.enable(servers)
    end,
    init = function()
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                _G.FloatRename = {}

                function FloatRename.core_rename(win)
                    local new_name = vim.trim(vim.fn.getline('.'))
                    vim.api.nvim_win_close(win, true)
                    vim.lsp.buf.rename(new_name)
                end

                function FloatRename.float_rename()
                    local opts = {
                        relative = 'cursor',
                        row = 1,
                        col = 0,
                        width = 25,
                        height = 1,
                        style = 'minimal',
                        border = 'rounded',
                        title = " New name ",
                        title_pos = "center",
                    }
                    local cword = vim.fn.expand('<cword>')
                    local buf = vim.api.nvim_create_buf(false, true)
                    local win = vim.api.nvim_open_win(buf, true, opts)
                    local fmt = '<cmd> lua FloatRename.core_rename(%d) <CR>'

                    vim.api.nvim_buf_set_lines(buf, 0, -1, false, { cword })
                    vim.api.nvim_buf_set_keymap(buf, 'i', '<CR>', string.format(fmt, win), { silent = true })
                    vim.api.nvim_buf_set_keymap(buf, 'n', '<CR>', string.format(fmt, win), { silent = true })
                    vim.api.nvim_buf_set_keymap(buf, 'n', 'q',
                        string.format("<cmd> lua vim.api.nvim_win_close(%d, true) <cr>", win), { silent = true })
                    vim.api.nvim_buf_set_keymap(buf, 'n', '<Esc>',
                        string.format("<cmd> lua vim.api.nvim_win_close(%d, true) <cr>", win), { silent = true })
                    vim.api.nvim_buf_set_keymap(buf, 'n', '<C-c>',
                        string.format("<cmd> lua vim.api.nvim_win_close(%d, true) <cr>", win), { silent = true })
                end

                local args = { border = "rounded" }

                vim.keymap.set("n", "<leader>ld", function() vim.diagnostic.open_float(args) end)
                vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
                vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

                local opts = { buffer = ev.buf, }

                vim.keymap.set("n", "<leader>lrn", FloatRename.float_rename, opts)

                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                vim.keymap.set("n", "K", function() vim.lsp.buf.hover(args) end, opts)
                vim.keymap.set("n", "<C-k>", function() vim.lsp.buf.signature_help(args) end, opts)
                vim.keymap.set({ "n", "v", }, "<leader>lca", vim.lsp.buf.code_action, opts)
                vim.keymap.set("n", "<leader>lf", function() vim.lsp.buf.format { async = true } end, opts)
                -- Не нужно
                -- vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
                -- vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
                -- vim.keymap.set("n", "<leader>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
                -- vim.keymap.set("n", "<leader>lrn", vim.lsp.buf.rename, opts)
                -- Заменено Telescope
                -- vim.keymap.set("n", "<localleader>ld", vim.diagnostic.setloclist)
                -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                -- vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
                -- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                -- vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
            end,
        })
    end,
}
