# env
export CLICOLOR=1
export XDG_CONFIG_HOME="$HOME/.config"
export https_proxy=http://127.0.0.1:7893 http_proxy=http://127.0.0.1:7893 all_proxy=socks5://127.0.0.1:7893

# path
path=(
  $HOME/bin
  $HOME/.local/bin
  /usr/local/sbin
  $path
)

# prompt
fpath+=(/opt/homebrew/share/zsh/site-functions)
autoload -U promptinit; promptinit
prompt pure
zstyle :prompt:pure:git:stash show yes
PURE_GIT_PULL=0

# completion
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}'
zstyle :compinstall filename '~/.zshrc'
autoload -Uz compinit
compinit

# fzf
if [ -d "/opt/homebrew/opt/fzf" ]; then
  source "/opt/homebrew/opt/fzf/shell/completion.zsh"
  source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"
fi

# zsh-autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# aliases
alias symbolicatecrash="/Applications/Xcode.app/Contents/SharedFrameworks/DVTFoundation.framework/Versions/A/Resources/symbolicatecrash"
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

# >>> pnpm >>>
export PNPM_HOME="/Users/songzhou/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# <<< pnpm <<<

# >>> yarn >>>
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
# <<< yarn <<<

# >>> opencode >>>
export PATH=/Users/songzhou/.opencode/bin:$PATH
# <<< opencode <<<

# >>> amp >>>
export PATH="/Users/songzhou/.amp/bin:$PATH"
# <<< amp <<<

# >>> npm-global >>>
export PATH="$HOME/.npm-global/bin:$PATH"
# <<< npm-global <<<

# >>> sharetalk build tools >>>
export PATH="/Users/songzhou/Developer/yofoto_ai/build:$PATH"
# <<< sharetalk build tools <<<

# >>> bun >>>
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "/Users/songzhou/.bun/_bun" ] && source "/Users/songzhou/.bun/_bun"
# <<< bun <<<

# >>> grok installer >>>
export PATH="$HOME/.grok/bin:$PATH"
fpath=(~/.grok/completions/zsh $fpath)
autoload -Uz compinit && compinit -C
# <<< grok installer <<<

# >>> claude code >>>
export CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC=1
export CLAUDE_CODE_NO_FLICKER=1
export ANTHROPIC_BASE_URL="http://127.0.0.1:5678"
export ANTHROPIC_AUTH_TOKEN=sk-150cece25d6444cdb316c1e90281e9fb
export ANTHROPIC_DEFAULT_OPUS_MODEL='claude-opus-5'
export ANTHROPIC_DEFAULT_SONNET_MODEL='claude-sonnet-5'
export ANTHROPIC_DEFAULT_HAIKU_MODEL='claude-haiku-4.5'
#export CLAUDE_CODE_MAX_CONTEXT_TOKENS=500000 #grok
# <<< claude code <<<
