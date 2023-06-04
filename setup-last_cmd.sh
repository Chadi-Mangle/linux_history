#! /bin/bash

cat << 'EOF' >> ~/last_cmd
#! /bin/bash

FILE="$1"
if [[ -z $1 ]];
then 
	FILE="history_cmd"
fi

touch ~/$FILE

if [ ${HOME##*/} = ${PWD##*/} ];
then
	echo -n "$USER:~$ " >> ~/$FILE
else
	echo -n "$USER:/${PWD##*/}$ " >> ~/$FILE
fi

tail -n 1 ~/.bash_history | cat >> ~/$FILE

exit
EOF

echo PROMPT_COMMAND='history -a' >> ~/.bashrc 
source ~/.bashrc
