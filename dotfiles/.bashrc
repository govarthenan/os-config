#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '


# govarthenan config start

# aliases
alias ls="ls -lah --color=always"
alias asbt="sudo bat-asus-battery threshold"
alias sysup="sudo pacman -Syyu && yay -Syyu && flatpak update"

# govarthenan config end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/gova/miniforge3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/gova/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/home/gova/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/home/gova/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/home/gova/miniforge3/etc/profile.d/mamba.sh" ]; then
    . "/home/gova/miniforge3/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

