#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ ! -d $HOME/.ssh/agent ]; then
	mkdir -p $HOME/.ssh/agent
fi

HOST=admin2

if [ ! "$(pidof ssh-agent)" ]
then
	ssh-agent | grep -v echo > $HOME/.ssh/agent/$HOST & pid=$!
	sleep 1
	. $HOME/.ssh/agent/$HOST
	ssh-add
fi

