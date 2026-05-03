# UI
export CLICOLOR=1
# prompt
fpath+=$HOME/.zsh/pure
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
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="/usr/local/sbin:$PATH"

alias symbolicatecrash="/Applications/Xcode.app/Contents/SharedFrameworks/DVTFoundation.framework/Versions/A/Resources/symbolicatecrash"
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

PATH="$HOME/.local/bin/:$PATH"

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

#export https_proxy=http://127.0.0.1:7893 http_proxy=http://127.0.0.1:7893 all_proxy=socks5://127.0.0.1:7893

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

export CLAUDE_CODE_NO_FLICKER=1

export ANTHROPIC_BASE_URL=http://127.0.0.1:8317
export ANTHROPIC_AUTH_TOKEN=google-key
export ANTHROPIC_DEFAULT_OPUS_MODEL=gemini-3.1-pro-high
export ANTHROPIC_DEFAULT_SONNET_MODEL=gemini-3-flash
export ANTHROPIC_DEFAULT_HAIKU_MODEL=gemini-3-flash
