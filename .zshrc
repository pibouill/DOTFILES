#                         ,---,                      
#                       ,--.' |                      
#       ,----,          |  |  :      __  ,-.         
#     .'   .`| .--.--.  :  :  :    ,' ,'/ /|         
#  .'   .'  .'/  /    ' :  |  |,--.'  | |' | ,---.   
#,---, '   ./|  :  /`./ |  :  '   ||  |   ,'/     \  
#;   | .'  / |  :  ;_   |  |   /' :'  :  / /    / '  
#`---' /  ;--,\  \    `.'  :  | | ||  | ' .    ' /   
#  /  /  / .`| `----.   \  |  ' | :;  : | '   ; :__  
#./__;     .' /  /`--'  /  :  :_:,'|  , ; '   | '.'| 
#;   |  .'   '--'.     /|  | ,'     ---'  |   :    : 
#`---'         `--'---' `--''              \   \  /  
#                                           `----'   
                                                    
autoload -U colors && colors

# History in cache directory
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

. $HOME

PROMPT='%n@%m%~%% '

# auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# Vim keys in tab complete 
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# ALIAS
alias ll='ls -lah --color=auto'
alias c="clear"
alias gwww="cc -Wall -Werror -Wextra"
alias rff="rm -rf"
alias vi  vim
alias i="open https://profile.intra.42.fr/"
alias gh="open https://github.com/pibouill"
alias vz="vi ~/.zshrc"
alias vrc="vi ~/.vimrc"
alias swcaps="~/.config/switch_caps_ctrl.sh"
alias work="cd ~/work/"
alias ..="cd .."
alias grep="grep --color=auto"
alias dotfiles="cd ~/.config/dotfiles/"

source ~/.config/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


alias vim-be-good="docker run -it --rm brandoncc/vim-be-good:stable"
alias francinette="$HOME"/francinette/tester.sh
alias paco="$HOME"/francinette/tester.sh
alias cclean='bash ~/Cleaner_42.sh'

# shortcuts
tc() {
  touch "$1.c"
}

# Load Catpuccin syntax highlight
source $HOME/.config/catppuccin_syntax/catppuccin_mocha-zsh-syntax-highlighting.zsh

# Load zsh-syntax-highlight
source $HOME/.config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


export MAIL=pibouill@student.42prague.com


SHARED_FOLDER="~"

alias devstation="\
	docker run \
  --cap-drop=ALL  \
  --cap-add=SYS_PTRACE \
  --privileged \
  --security-opt seccomp=unconfined \
  --security-opt apparmor=unconfined \
  --rm \
  -it -v ${SHARED_FOLDER}:/root/shared jterrazz/devstation zsh
"
export PATH=/opt/homebrew/bin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin
