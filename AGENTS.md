# Agent Guidelines for Dotfiles Repository

This document provides guidelines for agentic coding tools operating in this dotfiles repository.

## Build/Lint/Test Commands

### Neovim Configuration
- **Format**: Use `:ConformInfo` to check available formatters, then `:Conform` to format
- **Lint**: Use `:lua vim.diagnostic.setqflist()` to view diagnostics
- **Test**: No test framework configured. Use manual testing in Neovim.

### Shell Scripts
- **Lint**: Use `shellcheck` for shell scripts
- **Test**: Run scripts directly in terminal

### General Commands
- **Check syntax**: `nvim --headless -c 'checkhealth' -c 'qa'`
- **Update plugins**: `nvim --headless -c 'Lazy update' -c 'qa'`
- **Format all**: `nvim --headless -c 'Conform' -c 'qa'`

## Code Style Guidelines

### Lua (Neovim Configuration)

#### Imports
- Use relative imports for local modules
- Group imports by source (standard library, then third-party, then local)
- Example:
  ```lua
  local vim = vim
  local utils = require('config.utils')
  local plugin = require('plugins.some-plugin')
  ```

#### Formatting
- 2-space indentation (configured in options.lua)
- Maximum line length: 100 characters
- Use spaces, not tabs
- Add trailing commas in tables
- Example:
  ```lua
  local config = {
    key1 = 'value',
    key2 = 'value',
  }
  ```

#### Types
- Use Lua type annotations where appropriate
- Prefer explicit types for function parameters and returns
- Example:
  ```lua
  ---@param bufnr integer
  ---@return string
  local function get_buffer_name(bufnr)
    return vim.api.nvim_buf_get_name(bufnr)
  end
  ```

#### Naming Conventions
- **Variables**: snake_case
- **Functions**: snake_case
- **Tables/Modules**: PascalCase for module names, snake_case for keys
- **Constants**: UPPER_SNAKE_CASE
- **Booleans**: Prefix with `is_`, `has_`, `can_`, etc.

#### Error Handling
- Use `pcall` for protected calls
- Check for nil values explicitly
- Provide meaningful error messages
- Example:
  ```lua
  local ok, result = pcall(function()
    return some_risky_operation()
  end)
  
  if not ok then
    vim.notify("Error: " .. result, vim.log.levels.ERROR)
    return
  end
  ```

### Shell Scripts

#### Formatting
- 2-space indentation
- Use double quotes for variables: "$var"
- Always quote command substitutions: "$(command)"
- Use `[[ ]]` for conditionals, not `[ ]`

#### Error Handling
- Use `set -euo pipefail` at the top of scripts
- Check command success with `if ! command; then`
- Provide clear error messages to stderr

### Configuration Files

#### TOML (alacritty.toml)
- Use consistent indentation (2 spaces)
- Group related settings together
- Add comments for non-obvious settings

#### JSON (vscode/settings.json)
- 2-space indentation
- Sort keys alphabetically within sections
- Add trailing commas

## Repository Structure

```
.config/
  alacritty/      # Alacritty terminal configuration
  nvim/           # Neovim configuration (Lua)
    lua/
      config/      # Core configuration
      plugins/     # Plugin configurations
.vscode/         # VSCode settings
.zsh/            # Zsh configuration and scripts
```

## Plugin Management

- Neovim uses `lazy.nvim` for plugin management
- Plugins are defined in `.config/nvim/lua/plugins/`
- Each plugin category has its own file
- Use `:Lazy` command to manage plugins

## Formatting Tools

- **Prettier**: For JavaScript, TypeScript, HTML, CSS, Markdown
- **Black**: For Python
- **isort**: For Python imports
- **Conform.nvim**: Format on save (configured in language.lua)

## Linting Tools

- **vim.diagnostic**: Built-in Neovim diagnostics
- **LSP servers**: TypeScript (ts_ls), Python (pyright)
- **shellcheck**: For shell scripts

## Testing Approach

This is a dotfiles repository with no formal test suite. Testing is done through:
1. Manual verification in Neovim
2. Visual inspection of terminal configurations
3. Functional testing of shell scripts

## Best Practices

1. **Idempotency**: Configuration should be safe to reload multiple times
2. **Error Recovery**: Provide clear error messages and recovery paths
3. **Documentation**: Add comments for non-obvious configuration choices
4. **Performance**: Avoid expensive operations in autocommands
5. **Compatibility**: Test across different environments when possible

## Common Patterns

### Neovim Keymaps
```lua
vim.keymap.set('mode', 'lhs', 'rhs', { desc = "description", noremap = true, silent = true })
```

### Autocommands
```lua
vim.api.nvim_create_autocmd('Event', {
  pattern = 'pattern',
  callback = function()
    -- logic here
  end,
  desc = 'Description of autocommand'
})
```

### Plugin Configuration
```lua
return {
  {
    'author/plugin',
    dependencies = { 'dependency' },
    config = function()
      require('plugin').setup({})
    end,
    keys = { keymaps },
    event = 'VeryLazy',
  }
}
```

## Environment-Specific Notes

- **macOS**: Some configurations assume macOS environment (e.g., pbcopy)
- **Terminal**: Alacritty-specific configurations in alacritty.toml
- **Shell**: Zsh-specific configurations in .zshrc and .zsh/*

## Debugging Tips

1. Use `:messages` in Neovim to view error messages
2. Check `:Lazy log` for plugin installation issues
3. Use `vim.notify()` for debugging Lua code
4. Test shell scripts with `set -x` for verbose output

## Version Control

- Git is used for version control
- Commit messages should follow conventional commits style
- Keep changes focused and atomic
- Update documentation when making significant changes
