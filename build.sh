#!/bin/sh

trap 'exit 1' INT

source lib/check_requirements.sh
check_requirements || exit 1

# create tmp directory
if [ ! -d ./tmp ]; then
  mkdir ./tmp
fi

# activate requirements
source /usr/apps.sp3/nosupport/gsic/env/python-2.7.7.sh
source /usr/apps.sp3/nosupport/gsic/env/gcc-5.2.sh
source /usr/apps.sp3/nosupport/gsic/env/jdk-1.8.0_101.sh

# install virtualenv
if [ ! `which virtualenv` ]; then
  pip install --user virtualenv
fi

# create virtualenv
if [ ! -d "$HOME/.venv/tensorflow" ]; then
  virtualenv $HOME/.venv/tensorflow
fi

# activate virtualenv
source $HOME/.venv/tensorflow/bin/activate

# install bazel
if [ ! `which bazel` ]; then
  source lib/bazel.sh
  install_bazel
fi

# build tensorflow
source lib/tensorflow.sh
build_tensorflow
