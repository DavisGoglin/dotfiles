#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ ! -d $HOME/.ssh/agent ]; then
	mkdir -p $HOME/.ssh/agent
fi

# start ssh agent and propmpt for keys on login

HOST=`hostname -s`
if [ ! "$(pidof ssh-agent)" ]
then
	ssh-agent | grep -v echo > $HOME/.ssh/agent/$HOST & pid=$!
	sleep 1
	. $HOME/.ssh/agent/$HOST
	ssh-add
else
	echo "ssh-agent already running at $HOME/.ssh/agent/$HOST" 
fi

