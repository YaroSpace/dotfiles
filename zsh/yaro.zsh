# User configuration

export PATH="home/yaro/bin:$PATH"

# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

### Added by the Heroku Toolbelt
#export PATH="/usr/local/heroku/bin:$PATH"
#
#SSH_ENV=$HOME/.ssh/environment
## start the ssh-agent
#function start_agent {
#    echo "Initializing new SSH agent..."
#    # spawn ssh-agent
#    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
#    echo succeeded
#    chmod 600 "${SSH_ENV}"
#    . "${SSH_ENV}" > /dev/null
#    /usr/bin/ssh-add
#}
#   
#if [ -f "${SSH_ENV}" ]; then
#     . "${SSH_ENV}" > /dev/null
#     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
#        start_agent;
#    }
#else
#    start_agent;
#fi


export TMUX_TMPDIR='/tmp/tmux-1000'
eval `dircolors ~/.dircolors`

[ -s "/home/yaro/.nvm/nvm.sh" ] && . "/home/yaro/.nvm/nvm.sh" # This loads nvm
