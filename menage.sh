#!/bin/bash
CURRENT_DIRECTORY=`dirname $0`
echo current : $CURRENT_DIRECTORY
BAZAR_SRC=$CURRENT_DIRECTORY/bazar
BAZAR_CLEAN=$CURRENT_DIRECTORY/bazar_clean


# Suppression des précédent dossier de fixtures
rm -Rf $BAZAR_CLEAN
echo "Chargement des fixtures en cours ..."
echo "-----"

mkdir -p $BAZAR_CLEAN/videos \
$BAZAR_CLEAN/images \
$BAZAR_CLEAN/divers

BAZAR_IMG=$BAZAR_CLEAN/images
BAZAR_VID=$BAZAR_CLEAN/videos
BAZAR_DIV=$BAZAR_CLEAN/divers

FILES=`find $BAZAR_SRC -type f`

for FILE in $FILES
do 
	file $FILE | grep 'ISO Media' > /dev/null
	VAR_MEDIA=$?
	file $FILE | grep 'image data' > /dev/null
	VAR_IMG=$?
	if [ $VAR_IMG -eq 0 ]
	then
		cp $FILE $BAZAR_IMG
		echo "vous avez copies les images dans le dossier img"
	elif [ $VAR_MEDIA -eq 0 ]
	then
		cp $FILE $BAZAR_VID
		echo "vous avez copies les videos dans le dossier videos"
	else
		cp $FILE $BAZAR_DIV
		echo "vous avez copies les autres fichiers dans le dossier divers"
	fi
done



