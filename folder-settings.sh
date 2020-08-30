#!/bin/sh
echo "this script on vsftpd 3.0.2"
echo "write username (not a root and created user)"
read username

#Backup orginal file
sudo cp /etc/vsftpd/vsftpd.conf /etc/vsftpd/vsftpd.conf.orig
#Copy created file
sudo cp ./vsftpd.conf /etc/vsftpd/vsftpd.conf
#User add chroot
echo $username | sudo tee -a /etc/vsftpd/user_list

#folder permissions
sudo mkdir -p /home/$username/ftp/upload
sudo chmod 550 /home/$username/ftp
sudo chmod 750 /home/$username/ftp/upload
sudo chown -R $username: /home/$username/ftp

#vsftpd restart
sudo systemctl restart vsftpd
