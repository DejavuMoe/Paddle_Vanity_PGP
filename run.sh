#!/bin/bash

mkdir libs

tar -zxvf libgpg-error-1.46.tar.gz
tar -zxvf libgcrypt-1.10.1.tar.gz

cd libgpg-error-1.46
./configure --prefix="/home/aistudio/libs" && make && make install

cd ../libgcrypt-1.10.1
./configure --prefix="/home/aistudio/libs" CFLAGS="-I/home/aistudio/libs/include" LDFLAGS="-L/home/aistudio/libs/lib" && make && make install

cd ..
export LIBRARY_PATH=$LIBRARY_PATH:/home/aistudio/libs/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/aistudio/libs/lib

chmod +x gpg-fingerprint-filter-gpu

./gpg-fingerprint-filter-gpu -a ed25519 -j 4096 -t 59654321 "x{16}|x{15}|x{14}|x{8}y{8}|x{4}y{12}" /root/paddlejob/workspace/output/output.pgp