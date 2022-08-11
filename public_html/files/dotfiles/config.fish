# Disable greeting message
set fish_greeting ""


# Change colors
set fish_color_command blue light
set fish_color_autosuggestion yellow
set fish_color_cwd blue light
set fish_color_regular green
set fish_color_root red

function fish_status
    if [ $status -gt 0 ];
        set_color red
        printf "X"
    else
        set_color normal
        printf " "
    end
end

function fish_prompt
    fish_status     # Indicates return value of last command.
    if [ "$USER" = "root" ];
        # User is root. Make it show!
        set_color red --bold
    else
        # User is a boring non-root user.
        set_color normal --bold
    end
    set date (date +"%m/%d %T")
    printf "$date "

    set_color green
    printf "$PWD"
    set_color normal
    printf "> "
end

# Disable title
function fish_title
end

# Load aliases
if [ -f $HOME/.config/fish/aliases.fish ]
    . $HOME/.config/fish/aliases.fish
end

# Load local aliases
if [ -f $HOME/.config/fish/localaliases.fish ]
    . $HOME/.config/fish/localaliases.fish
end

function please
    eval "sudo $history[1]"
end
function fuck
    eval "sudo $history[1]"
end

function thankyou
    sudo -k
    cowsay "You're welcome!"
end




#volume up/down
function vu
    amixer set Master 2+ | grep -e 'Mono:' | awk '{print $3}'
end
function vd
    amixer set Master 2- | grep -e 'Mono:' | awk '{print $3}'
end
function vset
    amixer set Master $argv | grep -e 'Mono:' | awk '{print $3}'
end


if status --is-login

	#
	# Set some value for LANG if nothing was set before, and this is a
	# login shell.
	#

	if not set -q LANG >/dev/null
		set -gx LANG en_US.UTF-8
	end

	# Check for i18n information in
	# /etc/sysconfig/i18n

	if test -f /etc/sysconfig/i18n
		eval (cat /etc/sysconfig/i18n |sed -ne 's/^\([a-zA-Z]*\)=\(.*\)$/set -gx \1 \2;/p')
	end

	#
	# Put linux consoles in unicode mode.
	#

	if test "$TERM" = linux
		if expr "$LANG" : ".*\.[Uu][Tt][Ff].*" >/dev/null
			if which unicode_start >/dev/null
				unicode_start
			end
		end
	end
end

