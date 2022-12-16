## Paddle_Vanity_PGP

Calculating vanity PGP with AI Studio.

**Quick Start**

- register an account of AI Studio
- read **[What's This?](https://www.dejavu.moe/posts/vanity-pgp/#gpu-算号)** | **[How to use?](https://telegra.ph/Baidu-Flying-Pulp-AI-Learning-Center-PGP-Number-Counting-Tutorial-10-18)**
- create an AI Studio Project

- then edit the `run.sh`

  - `algorithm` ed25519/cv25519/rsa4096...
  - `-j` For nVidia Tesla V100 `4096` is a nice choice
  - `-t` Recommendation not to exceed 60,000,000

  ```bash
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
  ```

- change `start command` bash run.sh
- submit script task