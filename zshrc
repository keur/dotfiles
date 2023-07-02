source ~/.antigen.zsh

# Source my configs
for cfg in ~/.{aliases,exports,functions,extras}; do
   [[ -r "$cfg" ]] && source "$cfg"
done

[[  -r /usr/share/nvm/init-nvm.sh ]] && source /usr/share/nvm/init-nvm.sh

autoload -U compinit && compinit

# Antigen Stuffz
antigen use oh-my-zsh
antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen theme ys
antigen apply
