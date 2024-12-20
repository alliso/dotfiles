# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH="$PATH:$HOME/bin:/usr/local/bin:$HOME/go/bin:/nix/var/nix/profiles/default/bin:$HOME/.nix-profile/bin"

export EDITOR="nvim"

# Java lsp add lombok dependency
export JDTLS_JVM_ARGS="-javaagent:/Users/alliso/dotfiles/dependencies/lombok.jar"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/dotfiles/zsh/oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
CUSTOM_FUNCTIONS="$HOME/dotfiles/zsh/custom"
ZELLIJ_CONFIG_DIR="$HOME/.config/zellij"

plugins=(git tmux)

source $ZSH/oh-my-zsh.sh
source $CUSTOM_FUNCTIONS/navigation.zsh
source $CUSTOM_FUNCTIONS/mongo.zsh
source $CUSTOM_FUNCTIONS/obsidian.zsh
source $CUSTOM_FUNCTIONS/kafka.zsh
source $CUSTOM_FUNCTIONS/zellij.zsh
source $CUSTOM_FUNCTIONS/docker.zsh
source $CUSTOM_FUNCTIONS/git.zsh
source $CUSTOM_FUNCTIONS/go-daily-log.zsh
source $CUSTOM_FUNCTIONS/secrets.zsh
eval "$(zoxide init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh



[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

ZSH_TMUX_AUTOSTART=true
