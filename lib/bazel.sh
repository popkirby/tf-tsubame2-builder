#!/bin/sh
# bazel installer

function install_bazel {
  # activate JDK 8, gcc 5.2
  source /usr/apps.sp3/nosupport/gsic/env/jdk-1.8.0_101.sh
  source /usr/apps.sp3/nosupport/gsic/env/gcc-5.2.sh

  # download Bazel
  wget https://github.com/bazelbuild/bazel/releases/download/0.4.3/bazel-0.4.3-dist.zip -O ./tmp/bazel-0.4.3-dist
  unzip tmp/bazel-0.4.3-dist.zip -d tmp/bazel-0.4.3-dist

  # build
  pushd tmp/bazel-0.4.3-dist
  bash ./compile.sh

  # copy binary
  cp output/bazel $HOME/.local/bin
  popd
}
