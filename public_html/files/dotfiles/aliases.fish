# Global aliases
alias c 'cd ..'		# Up one foler
alias - 'cd -'		# Last folder
alias bc 'bc -ql'	# No welcome message, improved functions
#alias iftop 'iftop -B'	# Measure in Bytes instead of Bits
#alias ping 'ping -c3'	# Default to 3 attemps instead of unlimited
alias tmux 'tmux -2'	# Force 256 colors
#alias :e 'vim'		# Launch vim with ":e"
alias crontab 'crontab -i'	# No accidental removals

#alias 'rm -rf' 'echo ARE YOU SURE???; sleep 10s; rm -rf'


function please
	eval sudo $history[1]
end

alias javac 'javac *.java'
alias find  'find ^&-'
alias vimp  'vim -p'
alias ping 'ping 8.8.8.8 -c1'	# Default to 1 attemps instead of unlimited
alias sus 'sudo pm-suspend'
alias hib 'sudo pm-hibernate'
alias lock 'gnome-screensaver-command -l'
alias sagi 'sudo apt-get install'
alias shut 'sudo shutdown -h now'
alias rewifi 'sudo dhclient wlan0'
alias py 'python3'
alias py2 'python'
alias bset 'xbacklight -set'
