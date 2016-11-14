FTP_U="your_username"
FTP_P="your_password"
FTP_HOST="your_host"
FTP_DIR="your_host_path"

#FTP to server
ncftpput -DD -u $FTP_U -p $FTP_P $FTP_HOST $FTP_DIR piwebcam/ftp_tmp/*.jpg
echo pictures uploaded