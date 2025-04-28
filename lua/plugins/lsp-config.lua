return {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function ()
        vim.lsp.enable("pyright")
        vim.lsp.enable("lua_ls")
        vim.lsp.enable("ruff")
    end,
    init = function ()
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function (ev)
                local args = { border = "rounded" }

                vim.keymap.set("n", "<leader>ld", function() vim.diagnostic.open_float(args) end)
                vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
                vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

                local opts = { buffer = ev.buf, }
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                vim.keymap.set("n", "K", function() vim.lsp.buf.hover(args) end, opts)
                vim.keymap.set("n", "<C-k>", function() vim.lsp.buf.signature_help(args) end, opts)
                -- vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
                -- vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
                -- vim.keymap.set("n", "<leader>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
                vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)
                vim.keymap.set({ "n", "v", }, "<leader>la", vim.lsp.buf.code_action, opts)
                vim.keymap.set("n", "<leader>lf", function () vim.lsp.buf.format { async = true } end, opts)
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
