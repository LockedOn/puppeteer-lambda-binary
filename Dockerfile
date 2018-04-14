FROM amazonlinux
WORKDIR /chrome
RUN rpm -Uvh http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN yum install -y git redhat-lsb python bzip2 tar pkgconfig atk-devel alsa-lib-devel bison binutils brlapi-devel bluez-libs-devel bzip2-devel cairo-devel cups-devel dbus-devel dbus-glib-devel expat-devel fontconfig-devel freetype-devel gcc-c++ GConf2-devel glib2-devel glibc.i686 gperf glib2-devel gtk2-devel gtk3-devel java-1.*.0-openjdk-devel libatomic libcap-devel libffi-devel libgcc.i686 libgnome-keyring-devel libjpeg-devel libstdc++.i686 libX11-devel libXScrnSaver-devel libXtst-devel libxkbcommon-x11-devel ncurses-compat-libs nspr-devel nss-devel pam-devel pango-devel pciutils-devel pulseaudio-libs-devel zlib.i686 httpd mod_ssl php php-cli python-psutil wdiff --enablerepo=epel
#RUN cd ~ && git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git && echo "export PATH=$PATH:$HOME/depot_tools" >> ~/.bash_profile && source ~/.bash_profile
ADD build/buildChrome.sh /home/ec2-user/buildChrome.sh
RUN chmod +x  /home/ec2-user/buildChrome.sh
CMD /home/ec2-user/buildChrome.sh && mv /home/ec2-user/headless_shell.tar.gz /chome/