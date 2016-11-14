#!/bin/bash

#setup vars
DATE_STR=$(date +"%Y%m%d-%H%M") #%S for seconds
TIME_STR=$(date +"%H%M")
DATE_DIR=$(date +"%Y%m%d")
CAM_DIR="piwebcam/$DATE_DIR"
CAM_FILE="piwebcam-$DATE_STR.jpg"
CAM_FTP_FILE="$TIME_STR.jpg"

NITE_FROM=2130
NITE_TO=600


#check for todays folder
if [ ! -d "$CAM_DIR" ]; then
	mkdir -p "$CAM_DIR/resized"
fi

#take photo
#raspistill -ex night -v -o camtest04.jpg -rot 180 -ISO 3200
#if [ $TIME_STR -ge $NITE_FROM -o $TIME_STR -lt $NITE_TO ]; then
#	raspistill -ss 6000000 -mm average -ifx denoise -ISO 400 -sh 50 -br 50 -sa -100 -o $CAM_DIR/$CAM_FILE # ss=shutter in micro sec
#else
	raspistill -ex night -mm average -ifx denoise -n -o $CAM_DIR/$CAM_FILE
#fi
echo picture taken $CAM_DIR/$CAM_FILE

#resize photo for FTP
# convert -resize 1920x -quality 80 $CAM_DIR/$CAM_FILE $CAM_DIR/resized/$CAM_FTP_FILE
convert -resize 1920x -crop 1920x1080+0+0 -quality 80 $CAM_DIR/$CAM_FILE $CAM_DIR/resized/$CAM_FTP_FILE
#convert -crop 1920x1080+0+0 -quality 80 $CAM_DIR/resized/$CAM_FILE $CAM_DIR/resized/$CAM_FILE
echo picture resized and cropped

cp $CAM_DIR/resized/$CAM_FTP_FILE piwebcam/ftp_tmp/$CAM_FTP_FILE	
echo copied to FTP temp folder