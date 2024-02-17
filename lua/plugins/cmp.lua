return {
  {
    event = "VeryLazy",
    "hrsh7th/nvim-cmp",
    config = function()
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local cmp = require("cmp")
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

      -- 引入 lspkind-nvim 用于美化自动完成提示
      local lspkind = require('lspkind')
      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- 使用 vsnip
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif vim.fn["vsnip#available"](1) == 1 then
              vim.fn["vsnip#expandOrJump"]()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif vim.fn["vsnip#jumpable"](-1) == 1 then
              vim.fn["vsnip#jump"](-1)
            else
              fallback()
            end
          end, { "i", "s" }),
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-c>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'vsnip' }, -- 使用 vsnip
        }, {
          { name = 'buffer' },
        }),
        -- 使用 lspkind-nvim
        formatting = {
          format = lspkind.cmp_format({
            with_text = true, -- 显示 lsp 提示文字
            maxwidth = 50,    -- 最大宽度
            before = function(entry, vim_item)
              return vim_item
            end
          })
        }
      })

      cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
          { name = 'git' },
        }, {
          { name = 'buffer' },
        })
      })

      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' },
          { name = 'cmdline' },
        })
      })
    end,
  },
  {
    event = "VeryLazy",
    "hrsh7th/cmp-nvim-lsp",
  },
  {
    event = "VeryLazy",
    "hrsh7th/cmp-buffer",
  },
  {
    event = "VeryLazy",
    "hrsh7th/cmp-path",
  },
  {
    event = "VeryLazy",
    "hrsh7th/cmp-cmdline",
  },
  {
    event = "VeryLazy",
    "hrsh7th/cmp-vsnip", -- cmp 对 vsnip 的支持
  },
  {
    event = "VeryLazy",
    "hrsh7th/vim-vsnip", -- vim-vsnip 插件
  },
  {
    event = "VeryLazy",
    "rafamadriz/friendly-snippets", -- 通用代码片段集
  },
  {
    event = "VeryLazy",
    "onsails/lspkind-nvim", -- 美化自动完成提示的插件
  }
}
