vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true, silent = true })

local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[packadd packer.nvim]]
	end
end

ensure_packer()

-- Настройка плагинов
require('packer').startup(function()
	use 'wbthomason/packer.nvim' -- Сам Packer
	use {
		'nvim-lualine/lualine.nvim', -- Статусная строка
		requires = { 'nvim-tree/nvim-web-devicons', opt = true } -- Иконки (необязательно)
	}
	use 'morhetz/gruvbox'
	use({
		"olimorris/codecompanion.nvim",
		config = function()
			require("codecompanion").setup()
		end,
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			-- The following are optional:
			{ "MeanderingProgrammer/render-markdown.nvim", ft = { "markdown", "codecompanion" } },
		}
	})
	use({
        "robitx/gp.nvim",
        config = function()
        local conf = {
            -- For customization, refer to Install > Configuration in the Documentation/Readme
        }
        require("gp").setup(conf)

        -- Setup shortcuts here (see Usage > Shortcuts in the Documentation/Readme)
    end,
})

end)

-- Подключение lualine
require('lualine').setup({
	options = {
		theme = 'gruvbox', -- Укажите тему
	}
})
-- CodeCompanion
require("codecompanion").setup({
  strategies = {
    chat = {
      adapter = "openai",
    },
    inline = {
      adapter = "openai",
    },
  },
  adapters = {
    openai = function()
      return require("codecompanion.adapters").extend("openai", {
        env = {
          api_key = os.getenv("OPENAI_API_KEY"),
	  print("Extracted API Key:", api_key),
        },
      })
    end,
  },

})
local key = os.getenv("OPENAI_API_KEY")
if not key then
  print("API Key not set in environment variables")
else
  print("Extracted API Key from environment:", key)
end
