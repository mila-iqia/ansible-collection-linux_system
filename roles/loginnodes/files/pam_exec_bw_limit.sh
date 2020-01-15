# session   optional    pam_exec.so log=/tmp/pamoutput quiet /tmp/sshrc
#!/bin/bash

ID=$(/usr/bin/id $PAM_USER)

if [ "$PAM_TYPE" = "open_session" ]; then
	echo "Welcome $ID" >> /tmp/mytest
  iptables ....
elif [ "$PAM_TYPE" = "close_session" ]; then
	echo "Byebye $ID" >> /tmp/mytest
  iptables ....
fi
