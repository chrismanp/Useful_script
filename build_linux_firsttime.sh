sudo apt-get update

sudo apt-get install git fakeroot build-essential ncurses-dev xz-utils libssl-dev bc

tar xf linux-4.7.1.tar.xz

cd linux-4.7.1

cp /boot/config-$(uname -r) .config   

make menuconfig

sudo make -j 4 && sudo make modules_install -j 4 && sudo make install -j 4

update-initramfs -c -k 4.7.1   

update-grub  

