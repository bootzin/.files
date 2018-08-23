#!/bin/sh
# This script will run offlineimap and check
# for new email if there is an internet connection.
#
# If it detects new mail, it uses mpv to play a
# notification sound: notify.opus
#
# I have this run as a cronjob every 5 minutes.

export DISPLAY=:0.0

imapactive=$(ps -ef | grep '[o]fflineimap' | wc -l)

# kill offlineimap if active, sometimes it hangs
case $imapactive in
	'1')
		killall offlineimap && sleep 5
		;;
esac

# Checks for internet connection and set notification script.
# Settings are different for MacOS (Darwin) systems.
if [ "$(uname)" == "Darwin" ]
then
	ping -q -t 1 -c 1 `ip r | grep default | cut -d ' ' -f 3` >/dev/null || exit
	notify() { osascript -e "display notification \"$2 in $1\" with title \"Youve got Mail\" subtitle \"Account: $account\"" && sleep 2 ;}
else
	ping -q -w 1 -c 1 `ip r | grep default | cut -d ' ' -f 3` >/dev/null || exit
	notify() { pgrep -x dunst && notify-send -i ~/.config/neomutt/email.gif "$2 new mail(s) in \`$1\` account." ;}
fi

# Run offlineimap. You can feed this script different settings.
offlineimap -o "$@"

# Check all accounts/mailboxes for new mail. Notify if there is new content.
for account in $(ls ~/Mail)
do
	#List unread messages newer than last mailsync and count them
	newcount=$(find ~/Mail/$account/INBOX/new/ -type f -newer ~/.config/neomutt/mailsynclastrun 2> /dev/null | wc -l)
	if [ "$newcount" -gt "0" ]
	then
		notify "$account" "$newcount" & disown
		mpv --quiet ~/.config/neomutt/notify.opus
		# pkill -RTMIN+12 i3blocks # For my i3blocks setup. Updates new mail counter.
	fi
done

#Create a touch file that indicates the time of the last run of mailsync
touch ~/.config/neomutt/mailsynclastrun
