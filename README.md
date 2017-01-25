# TensorFlow builder for TSUBAME 2.5

`build.sh` builds TensorFlow

## Requrement
- `export PATH=$HOME/.local/bin:$PATH` in `$HOME/.bash_profile`
- python 2.7.7 (`source /usr/apps.sp3/nosupport/gsic/env/python-2.7.7.sh`)
- gcc 5.2 (`source /usr/apps.sp3/nosupport/gsic/env/gcc-5.2.sh`)
- jdk 1.8 (`source /usr/apps.sp3/nosupport/gsic/env/jdk-1.8.0_101.sh`)
- accessible to external site (http://tsubame.gsic.titech.ac.jp/node/1344)
- newer binutils installed by linuxbrew
- cuDNN (`export LD_LIBRARY_PATH=/usr/apps.sp3/nosupport/gsic/cudnn/5.1-cuda7.5/cuda/lib64`)

## install
```sh
$ bash build.sh
```
