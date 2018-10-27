if [! -d testcode/ ]; then
    mkdir testcode
fi

cd testcode/

wget -r -np -R "index.html*" http://www.hboehm.info/gc/gc_bench/

#gcc -DGC=1 GCBench.c /usr/local/lib/libgc.so  -o GCBench 
