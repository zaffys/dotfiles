local status, installer = pcall(require, "nvim-lsp-installer")
if (not status) then return end

installer.setup {
	automatic_installation = true,
	ui = {
		icons = {
			server_installed = "✓",
			server_pending = "➜",
			server_uninstalled = "✗"
		}
	}
}
