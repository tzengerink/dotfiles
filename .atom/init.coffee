# Quick save when in insert mode
atom.commands.add 'atom-text-editor', 'custom:quick-save', ->
  editor = atom.workspace.getActiveTextEditor()
  atom.workspace.saveActivePaneItem()
  atom.packages.getActivePackage('vim-mode').mainModule
    .getEditorState(editor)
    .activateNormalMode()
