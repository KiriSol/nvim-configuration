return {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function ()
        vim.lsp.enable("pyright")
        vim.lsp.enable("lua_ls")
    end,
    init = function ()
        -- Set global key mappings
        vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float)
        vim.keymap.set("n", "<leader>[d", vim.diagnostic.goto_prev)
        vim.keymap.set("n", "<leader>]d", vim.diagnostic.goto_next)
        vim.keymap.set("n", "<leader>lD", vim.diagnostic.setloclist)

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function (ev)
                -- Enable compleection triggered by <c-x><c-o>
                -- vim.bo[ev.buff].omnifunc = "v:lua.vim.lsp.omnifunc"

                local opts = { buffer = ev.buf }
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
                vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
                vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
                vim.keymap.set("n", "<leader>wl", function ()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folder()))
                end, opts)
                vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
                vim.keymap.set("n", "<leader>lrn", vim.lsp.buf.rename, opts)
                vim.keymap.set({ "n", "v", }, "<leader>la", vim.lsp.buf.code_action, opts)
                vim.keymap.set("n", "<leader>lre", vim.lsp.buf.references, opts)
                vim.keymap.set("n", "<leader>lf", function () vim.lsp.buf.format { async = true } end, opts)
            end,
        })
    end,
}
