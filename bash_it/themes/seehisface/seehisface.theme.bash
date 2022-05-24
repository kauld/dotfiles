#!/usr/bin/env bash

export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWSTASHSTATE=true

export PROMPT_DIRTRIM=3

is_vim_shell() {
    if [ ! -z "$VIMRUNTIME" ]
    then
        echo "[${red}VIM${normal}]"
    fi
}

is_ssh_shell() {
    if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
        echo "${normal}[${red}SSH${normal}]"
    fi
}
# show chroot if exist
chroot(){
    if [ -n "$debian_chroot" ]
    then
        my_ps_chroot="${bold_cyan}$debian_chroot${normal}";
        echo "($my_ps_chroot)";
    fi
}

# show virtualenvwrapper
my_ve(){

    if [ -n "$CONDA_DEFAULT_ENV" ]
    then
        my_ps_ve="${bold_purple}${CONDA_DEFAULT_ENV}${normal}";
        echo "($my_ps_ve)";
    elif [ -n "$VIRTUAL_ENV" ]
    then
        my_ps_ve="${bold_purple}$ve${normal}";
        echo "($my_ps_ve)";
    fi
    echo "";
}

function prompt_command() {
    if [ -n "$VIRTUAL_ENV" ]
    then
        ve=`basename "$VIRTUAL_ENV"`;
    fi

    if [[ ${EUID} == 0 ]] ; then
        PS1="\[\e]0;\h\a\]┌─$(is_vim_shell)[$(clock_prompt)]$(my_ve)${yellow}[${red}\u@\h$(is_ssh_shell) ${green}\w${yellow}]${red}$(__git_ps1 "(%s)")${normal}\\n└─▪ "
    else
        PS1="\[\e]0;\h\a\]┌─$(is_vim_shell)[$(clock_prompt)]$(my_ve)${yellow}[${cyan}\u@\h$(is_ssh_shell) ${green}\w${yellow}]${red}$(__git_ps1 "(%s)")${normal}\\n└─▪ "
    fi
}

safe_append_prompt_command prompt_command
