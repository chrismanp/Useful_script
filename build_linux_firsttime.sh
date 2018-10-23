sudo apt-get update

read -p "Press any key"

sudo apt-get install git fakeroot build-essential ncurses-dev xz-utils libssl-dev bc

read -p "Press any key"

wget https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.7.1.tar.xz
tar xf linux-4.7.1.tar.xz

read -p "Press any key"

cd linux-4.7.1

read -p "Press any key"


cp /boot/config-$(uname -r) .config   

read -p "Press any key"


make menuconfig

read -p "Press any key"


sudo make -j 4 && sudo make modules_install -j 4 && sudo make install -j 4

read -p "Press any key"


sudo update-initramfs -c -k 4.7.1   

read -p "Press any key"


sudo update-grub  

