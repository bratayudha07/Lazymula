return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      -- Python LSP (ringan)
      jedi_language_server = {
        mason = false,
      },

      -- Lua LSP
      lua_ls = {
        mason = false,
      },

      -- ✅ Opsi alternatif Python (pylsp) - tinggal uncomment jika ingin pakai
      -- pylsp = {
      --   settings = {
      --     pylsp = {
      --       plugins = {
      --         pyflakes = { enabled = true },
      --         pylint = { enabled = false },
      --         rope = { enabled = false },
      --         yapf = { enabled = false },
      --         autopep8 = { enabled = false },
      --         mccabe = { enabled = false },
      --       },
      --     },
      --   },
      -- },
    },

    setup = {
      -- Setup untuk Python (jedi-language-server) dengan hover handler
      jedi_language_server = function(_, opts)
        opts.cmd = { "jedi-language-server" }
        opts.init_options = {
          completion = {
            disableSnippets = false,
            resolveEagerly = false,
          },
          diagnostics = {
            enable = true,
            didOpen = true,
            didSave = true,
            didChange = false,
          },
          workspace = {
            extraPaths = {},
          },
          -- Potong panjang hover doc
          hover = {
            enable = true,
            disable = {
              -- Sembunyikan bagian yang tidak perlu
              ["*"] = {
                all = false,
                names = {},
                fullName = false,
              },
            },
          },
        }

        -- Batasi panjang hover via handler
        opts.handlers = {
          ["textDocument/hover"] = function(err, result, ctx, config)
            if result and result.contents then
              local content = result.contents
              if type(content) == "table" and content.value then
                -- Ambil baris pertama saja (signature)
                local lines = vim.split(content.value, "\n")
                local short = {}
                for i, line in ipairs(lines) do
                  table.insert(short, line)
                  if i >= 6 then
                    break
                  end -- Maksimal 6 baris
                end
                content.value = table.concat(short, "\n")
              end
            end
            vim.lsp.handlers["textDocument/hover"](err, result, ctx, config)
          end,
        }
      end,

      -- Setup untuk Lua (lua-language-server)
      lua_ls = function(_, opts)
        opts.cmd = { "lua-language-server" }
        -- Settings khusus Lua
        opts.settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = { enable = false },
          },
        }
      end,
    },
  },
}
