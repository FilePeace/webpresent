#!/bin/sh

echo "Installing webpresent's dependencies..."
pip install gdown

echo "Installing 'webpresent' syswide..."

#sudo cp -f ethgas /usr/bin/ethgas

#if [ ! -e /usr/lib/webpresent ]; then sudo mkdir /usr/lib/webpresent; fi
sudo cp -f webpresent /usr/bin/
#sudo cp -f README.md /usr/lib/webpresent/

#installfail(){
#   echo "Installation has failed."
#   exit 1
#}

if [ -f /usr/bin/webpresent ];then
   echo "- Turning 'webpresent' into an executable..."
   sudo chmod +x /usr/bin/webpresent
#   if ethgas babyisalive; then echo "Done! Running 'ethgas' command as example to use it:" && (ethgas &);exit 0; else installfail; fi
#   else
#      installfail
fi

#if [ -f /usr/lib/zombiespices/installer.sh ];then
#   echo "- Turning zombiespices' installer.sh into an executable..."
#   sudo chmod +x /usr/lib/zombiespices/installer.sh
#fi
