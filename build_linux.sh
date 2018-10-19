cp /boot/config-$(uname -r) .config   

make menuconfig

sudo make -j 4 && sudo make modules_install -j 4 && sudo make install -j 4


