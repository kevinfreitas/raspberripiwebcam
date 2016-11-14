#!/bin/bash
YESTERDAY=$(date --date='1 day ago' +"%Y%m%d")
#YESTERDAY=$(date +"%Y%m%d")
YESTERDAY_TEXT=$(date +"%Y-%m-%d")
CAM_DIR="piwebcam/$YESTERDAY"
WEEK_AGO=$(date --date="4 days ago" +"%Y%m%d")
FPS=30
BR=6000

echo "folder $CAM_DIR"

# encode time lapse
# mencoder mf://${HOME}/${CAM_DIR}/resized/*.jpg -mf fps=${FPS}:type=jpeg -vf scale=1920:1080 -ovc x264 -x264encopts pass=1:bitrate=${BR}:crf=20 -nosound -ofps ${FPS} -noskip -o ${HOME}/${CAM_DIR}/piwebcam-${YESTERDAY}-timelapse.mp4
# echo "time lapse created"

#upload to YouTube
#google youtube post --title "PiWebcam - ${DATE}" --tag "webcam, time lapse, piwebcam" --summary "Time lapse video generated from webcam pictures taken every 1 minutes." --user kevinfreitas.net@gmail.com ${HOME}/${CAM_DIR}/piwebcam-${YESTERDAY}-timelapse.mp4
#python ${HOME}/youtube-upload/upload_video.py --file=${HOME}/${CAM_DIR}/piwebcam-${YESTERDAY}-timelapse.mp4 --title="PiWebcam - ${YESTERDAY_TEXT}" --description="Time lapse video generated from webcam pictures taken every 1 minutes" --keywords="webcam, time lapse, piwebcam" --privacyStatus="unlisted" --noauth_local_webserver
#echo "uploaded to YouTube"

# clean up old folders
if [ -d "${HOME}/piwebcam/${WEEK_AGO}" ]; then
	echo "remove old folder /piwebcam/${WEEK_AGO}/"
	rm -R "${HOME}/piwebcam/${WEEK_AGO}"
fi

shutdown -r now