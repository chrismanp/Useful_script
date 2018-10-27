sudo apt-get install autoconf
sudo apt-get install libtool

git clone git://github.com/ivmai/bdwgc.git

read -p "Press any key"

cd bdwgc

read -p "Press any key"

git clone git://github.com/ivmai/libatomic_ops.git

read -p "Press any key"

./autogen.sh

read -p "Press any key"

./configure

read -p "Press any key"

make -j

read -p "Press any key"

make check

read -p "Press any key"

make install
