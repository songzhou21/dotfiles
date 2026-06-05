
# Kiro CLI pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh"

# UI
export CLICOLOR=1
# prompt
fpath+=(/opt/homebrew/share/zsh/site-functions)
autoload -U promptinit; promptinit
prompt pure

zstyle :prompt:pure:git:stash show yes

PURE_GIT_PULL=0

# The following lines were added by compinstall

zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}'
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


# fzf
if [ -d "/opt/homebrew/opt/fzf" ]; then
  source "/opt/homebrew/opt/fzf/shell/completion.zsh"
  source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"
fi

export PATH="/usr/local/sbin:$PATH"

alias symbolicatecrash="/Applications/Xcode.app/Contents/SharedFrameworks/DVTFoundation.framework/Versions/A/Resources/symbolicatecrash"
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

PATH="$HOME/.local/bin/:$PATH"

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

export https_proxy=http://127.0.0.1:7893 http_proxy=http://127.0.0.1:7893 all_proxy=socks5://127.0.0.1:7893

# pnpm
export PNPM_HOME="/Users/songzhou/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# opencode
export PATH=/Users/songzhou/.opencode/bin:$PATH

# Amp CLI
export PATH="/Users/songzhou/.amp/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"

export XDG_CONFIG_HOME="$HOME/.config"

# ShareTalk Build Tools
export PATH="/Users/songzhou/Developer/yofoto_ai/build:$PATH"

export CLAUDE_CODE_NO_FLICKER=1

# Kiro CLI post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh"

# bun completions
[ -s "/Users/songzhou/.bun/_bun" ] && source "/Users/songzhou/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Added by Antigravity
export PATH="/Users/songzhou/.antigravity/antigravity/bin:$PATH"


# Added by Antigravity CLI installer
export PATH="/Users/songzhou/.local/bin:$PATH"

# Added by Antigravity IDE
export PATH="/Users/songzhou/.antigravity-ide/antigravity-ide/bin:$PATH"
