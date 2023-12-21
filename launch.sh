#!/bin/bash
#set -x
#    --------------------------------------------------------------------------
#    Nom du script : matrix.sh
#    Date de creation : 30/11/2012
#    Version : 0.01
#    Auteur : >(°<°)< nycot@dcprod.org
#    --------------------------------------------------------------------------
#    Objet : Affichage d'un pseudo matrix
#    --------------------------------------------------------------------------

#    --------------------------------------------------------------------------
#    Variable
#    --------------------------------------------------------------------------

MATRICE="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
MATRICE="${MATRICE}abcdefghijklmnopqrstuvwxyz"
MATRICE="${MATRICE}0123456789"
MATRICE="${MATRICE}\$@&~#{([-_])}+="
EX=0
clear
tput setf 2

#    --------------------------------------------------------------------------
#    Fonctions
#    --------------------------------------------------------------------------

CHUTE()
{
	local BAS=$((RANDOM%9))
	local FIN=$((`tput lines`-$BAS))
	local COL=$((RANDOM%`tput cols`))
	local LIN=$((RANDOM%$FIN))
	local RMLIN=$LIN
	local RMCOL=$COL
	local SPEED=$((RANDOM%9))
	local CHUTETIME=$((RANDOM%7))

	while [ $LIN != $FIN ]
		do
			local CARA="$CARA${MATRICE:$(($RANDOM%${#MATRICE})):1}"
			tput cup $LIN $COL && printf "$CARA"
			unset CARA
			local   LIN=$(($LIN+1))
			sleep .0$SPEED
	done

	sleep $CHUTETIME

	while [ $RMLIN != $FIN ]
		do
			tput cup $RMLIN $RMCOL && printf " "
			local  RMLIN=$(($RMLIN+1))
	done

}

#    --------------------------------------------------------------------------
#    exec
#    --------------------------------------------------------------------------

while [ $EX != 150 ]
	do
		TIME=$((RANDOM%9))
		CHUTE &
		sleep .2
		EX=$((EX+1))
done

sleep 15
