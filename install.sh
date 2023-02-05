#!/bin/sh

rocketlaunch_dir=`pwd` #from https://unix.stackexchange.com/a/52919/470623

echo "Installing webpresent's dependencies..."
sudo apt install python3-pip
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

echo "Installing mimetypes and their icons..." # this is continuously adding the same entries to /etc/mime.types and have to be fixed
cat >> /etc/mime.types <<EOF
text/x-webpresent			webpresent
text/x-weborigin			weborigin
EOF
#-<- should check if line is already added, before re-adding!
cat > /usr/share/mime/packages/x-webpresent.xml <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<mime-info xmlns='http://www.freedesktop.org/standards/shared-mime-info'>
  <mime-type type="text/x-webpresent">
    <comment>FilePeace's Webpresent file</comment>
    <generic-icon name="text-x-webpresent"/>
    <glob pattern="*.webpresent"/>
  </mime-type>
</mime-info>

EOF
cat > /usr/share/mime/packages/x-weborigin.xml <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<mime-info xmlns='http://www.freedesktop.org/standards/shared-mime-info'>
  <mime-type type="text/x-weborigin">
    <comment>FilePeace's Webpresent file</comment>
    <generic-icon name="text-x-weborigin"/>
    <glob pattern="*.weborigin"/>
  </mime-type>
</mime-info>

EOF
sudo update-mime-database /usr/share/mime

echo "Installing icons for .webpresent and .weborigin files..."
cd include/icons
cp -r -f --preserve=all . /usr/share/icons/hicolor/scalable/mimetypes/
cd "$rocketlaunch_dir"
sudo gtk-update-icon-cache /usr/share/icons/gnome/ -f

#if [ -f /usr/lib/zombiespices/installer.sh ];then
#   echo "- Turning zombiespices' installer.sh into an executable..."
#   sudo chmod +x /usr/lib/zombiespices/installer.sh
#fi
