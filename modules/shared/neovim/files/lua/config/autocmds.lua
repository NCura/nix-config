-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Register jinja file types for jinja-lsp
vim.filetype.add {
  extension = {
    jinja = 'jinja',
    jinja2 = 'jinja',
    j2 = 'jinja',
  },
}

-- Register ansible file types
vim.filetype.add {
  pattern = {
    [".*/playbooks/.*%.ya?ml"] = "yaml.ansible",
    [".*/roles/.*/tasks/.*%.ya?ml"] = "yaml.ansible",
    [".*/roles/.*/handlers/.*%.ya?ml"] = "yaml.ansible",
    [".*/roles/.*/vars/.*%.ya?ml"] = "yaml.ansible",
    [".*/roles/.*/defaults/.*%.ya?ml"] = "yaml.ansible",
    [".*/roles/.*/meta/.*%.ya?ml"] = "yaml.ansible",
    [".*/host_vars/.*%.ya?ml"] = "yaml.ansible",
    [".*/group_vars/.*%.ya?ml"] = "yaml.ansible",
    [".*/inventory/.*%.ya?ml"] = "yaml.ansible",
  },
  filename = {
    ["site.yml"] = "yaml.ansible",
    ["site.yaml"] = "yaml.ansible",
    ["main.yml"] = function(path, bufnr)
      if string.match(path, "/roles/") then
        return "yaml.ansible"
      end
    end,
  },
}
