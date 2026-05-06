-- lsp/sourcekit.lua
return {
  cmd = { 'xcrun', 'sourcekit-lsp' },
  filetypes = { 'swift', 'objective-c', 'objective-cpp', 'c', 'cpp' },
  root_markers = {
    'buildServer.json',
    'compile_commands.json',
    '.sourcekit-lsp',
    'Package.swift',
    '.git',
  },
  get_language_id = function(_, ftype)
    if ftype == 'objective-c' then return 'objective-c' end
    if ftype == 'objective-cpp' then return 'objective-cpp' end
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
