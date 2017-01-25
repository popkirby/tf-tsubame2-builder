#!/bin/sh

function install_tensorflow {
  # clone tensorflow@r0.12
  git clone -b r0.12 --single-branch --depth=1 https://github.com/tensorflow/tensorflow tmp/tensorflow

  # python requirements
  pip install numpy six

  cd tmp/tensorflow

  # patch configure
  patch -p1 < ../../patch/configure.patch

  # patch CROSSTOOL.tpl
  sed -e "s#@@HOME@@#$HOME#g" ../../patch/CROSSTOOL.tpl.patch > ../CROSSTOOL.tpl.patch
  patch -p1 < ../CROSSTOOL.tpl.patch

  # patch crosstool_wrapper_driver_is_not_gcc.tpl
  patch -p1 < ../../patch/crosstool_wrapper_driver_is_not_gcc.tpl

  export PYTHON_BIN_PATH=`which python` 
  export TF_NEED_GCP=0
  export TF_NEED_HDFS=0
  export TF_NEED_OPENCL=0
  export TF_NEED_CUDA=1
  export GCC_HOST_COMPILER_PATH=/usr/apps.sp3/nosupport/gsic/gcc/4.9.3/bin/gcc
  export TF_CUDA_VERSION=7.5
  export CUDA_TOOLKIT_PATH=/usr/apps.sp3/cuda/7.5
  export TF_CUDNN_VERSION=5.1.3
  export CUDNN_INSTALL_PATH=/usr/apps.sp3/nosupport/gsic/cudnn/5.1-cuda7.5/cuda
  export TF_CUDA_COMPUTE_CAPABILITIES=3.5
  ./configure

  # patch protobuf
  protobuf_patch_path=$(command readlink -f ../../patch/protobuf.bzl.patch)
  pushd `bazel info output_base`
  patch -p1 < $protobuf_patch_path
  popd

  # build
  bazel build -c opt --config=cuda --verbose_failures \
    //tensorflow/tools/pip_package:build_pip_package
  bazel-bin/tensorflow/tools/pip_package/build_pip_package ../
}
