#!/bin/sh

RED='\033[0;31m'
NC='\033[0m'

clear
echo "Loading..."
sleep 1
clear

echo "  ___           _        _ _	"
echo " |_ _|_ __  ___| |_ __ _| | |	"
echo "  | || '_ \/ __| __/ _` | | |	"
echo "  | || | | \__ \ || (_| | | |	"
echo " |___|_| |_|___/\__\__,_|_|_|	"

echo "  ____                  _             _             ____             _		"
echo " / ___|  __ _ _ __ ___ | |__   __ _  | |__  _   _  |  _ \ __ _  ___ | | ___	"
echo " \___ \ / _` | '_ ` _ \| '_ \ / _` | | '_ \| | | | | |_) / _` |/ _ \| |/ _ \	"
echo "  ___) | (_| | | | | | | |_) | (_| | | |_) | |_| | |  __/ (_| | (_) | | (_) |	"	
echo " |____/ \__,_|_| |_| |_|_.__/ \__,_| |_.__/ \__, | |_|   \__,_|\___/|_|\___/	"
echo "                                            |___/					"

echo -e "\nSamba File Server Installation For Ubuntu Server"

echo -e "${RED}\nWARNING: This Server Must Be Connected to internet in order to proceed!"
echo -e "${RED}\nWARNING: This will clear existing samba installed."
echo -e "${NC}Do you want to continue [Y/n]?"
read ready

if [[ -z $ready || $ready == "n" || $ready == "N" ]]; then
  exit
fi

echo -e "${RED}==> ${NC}Preparing..."
sleep 1

echo -e "${RED}==> ${NC}Checking for old installations..."
sleep 1

if [ -d /etc/samba ]; then
  echo "Found! Cleaning up..."
  rm -rf /etc/samba
  rm -rf /var/lib/samba
  rm -rf /usr/share/samba
  rm -rf /usr/share/doc/samba
  rm -rf /usr/share/bug/samba
  rm -rf /usr/sbin/smbd
  rm -rf /usr/sbin/samba
  rm -rf /usr/sbin/nmbd
  rm -rf /usr/libexec/samba
  rm -rf /usr/lib/x86_64-linux-gnu/samba
  rm -rf /usr/lib/systemd/system/nmbd.service
  rm -rf /usr/lib/systemd/system/samba-ad-dc.service
  rm -rf /usr/lib/systemd/system/smbd.service
  rm -rf /etc/init.d/samba-ad-dc
  rm -rf /etc/init.d/smbd
  rm -rf /etc/init.d/nmbd
  rm -rf /etc/apparmor.d/samba
fi

echo -e "${RED}==> ${NC}Updating your system..."
sleep 1
apt update

echo -e "${RED}==> ${NC}Installing Samba..."
sleep 1
apt install samba

echo -e "${RED}==> ${NC}Updating Firewall for samba..."
sleep 1
firewall-cmd --add-service=samba --permanent
firewall-cmd --add-port=445/tcp --permanent
firewall-cmd --reload
echo -e "${RED}==> ${NC}Added samba to firewall..."
sleep 1

echo "Done! Now configure samba according to your taste!."
echo "Use this command: sudo vi /etc/samba/smb.conf "
echo "This will allow you to configure samba."
echo "If you have questions just send me an email on esmeropaolo@gmail.com"
echo "Good Luck!"