-- lsp/sourcekit.lua
return {
  cmd = { 'xcrun', 'sourcekit-lsp' },
  filetypes = { 'swift' },
  root_markers = {
    'buildServer.json',
    'compile_commands.json',
    '.sourcekit-lsp',
    'Package.swift',
    '.git',
  },
  get_language_id = function(_, ftype)
    return ftype
  end,
  capabilities = {
    workspace = {
      didChangeWatchedFiles = {
        dynamicRegistration = true,
      },
    },
    textDocument = {
      diagnostic = {
        dynamicRegistration = true,
        relatedDocumentSupport = true,
      },
    },
  },
}
