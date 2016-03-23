#!/bin/sh

echo looking for folder $1 in ~/.ssh
SSH_DIR=~/.ssh
KEY_DIR=$SSH_DIR/$1

backup() {
	#look for backup directory
        BACKUP_DIR=$SSH_DIR/backup
        if [ ! -d "$BACKUP_DIR" ]; then
                echo creating backup directory $BACKUP_DIR
                mkdir $BACKUP_DIR
        fi

        #backup ida_rsa and ida_rsa.pub
        DATE=`date +%Y-%m-%d_%T`
        if [ -f "$SSH_DIR/id_rsa" ]; then
                echo $SSH_DIR/id_rsa found moving to backup directory as id_rsa_$DATE
                mv $SSH_DIR/id_rsa $BACKUP_DIR/id_rsa_$DATE
        fi

        if [ -f "$SSH_DIR/id_rsa.pub" ]; then
                echo $SSH_DIR/id_rsa.pub found moving to backup directory as id_rsa.pub_$DATE
                mv $SSH_DIR/id_rsa.pub $BACKUP_DIR/id_rsa.pub_$DATE
        fi
}

if [ $# -eq 0 ]; then
	PUB_KEY=~/.ssh/id_rsa.pub
	if [ -f $PUB_KEY ]; then
		printf "Your current key: \n"
		cat $PUB_KEY
	fi
	if [ ! -f $PUB_KEY ]; then
		printf "No current public key \n"
	fi
	echo "you must provide one parameter"
	echo "usage: ./change-ssh.sh <foldername>"
	echo "where <foldername> is a name of a folder in ~/.ssh"
	echo "or: ./change-ssh.sh clear - backs up the currecnt ssh keys and clears them"
	exit
fi

if [ "$1" == "clear" ]; then
	echo running clear
	backup	
	exit
fi


if [ -d "$KEY_DIR" ]; then
	echo moving directory to $SSH_DIR;
	cd $SSH_DIR;
	
	#run a backup of files	
	backup
	
	echo copying keys from $KEY_DIR
	cp $KEY_DIR/* .
fi
if [ ! -d "$KEY_DIR" ]; then
	echo $1 does not exist in the $SHH_DIR directory
fi

