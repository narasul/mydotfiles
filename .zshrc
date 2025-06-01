# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


ZSH_THEME="powerlevel10k/powerlevel10k"

alias vim=nvim

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

PATH="$PATH":"/opt/nvim-linux-x86_64/bin/"

PATH="$PATH":"$HOME/.local/scripts/"
chmod +x "$HOME/.local/scripts/tmux-sessionizer.sh"
bindkey -s ^f "tmux-sessionizer.sh\n"

export TERM=screen-256color
