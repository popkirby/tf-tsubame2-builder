#!/bin/bash

lib=$(readlink -e `dirname $BASH_SOURCE`)
source $lib/util.sh
# check requirements for installation.

function check_requirements {
  local result
  result=0
  # 1. $HOME/.local/bin
  case ":$PATH:" in
    *:$HOME/.local/bin:*)
      pass "\$HOME/.local/bin is in \$PATH"
      ;;
    *)
      fail "\$HOME/.local/bin is not in \$PATH"
      result=1
      ;;
  esac

  # 2. can access to outside
  if [ `hostname` != "t2a006170" ]; then
    fail "Only host t2a006170 is accessible to external site;"
    fail "see: http://tsubame.gsic.titech.ac.jp/node/1344"
    result=1
  elif [[ $http_proxy != *"proxy.noc.titech.ac.jp:3128" || $https_proxy != *"proxy.noc.titech.ac.jp:3128" ]]; then
    fail "Proxy is not set;"
    fail "see: http://tsubame.gsic.titech.ac.jp/node/1344"
    result=1
  else
    pass "can access to external site"
  fi

  # 3. libcupti.so
  case ":$LD_LIBRARY_PATH:" in
    *:/usr/apps.sp3/cuda/7.5/extras/CUPTI/lib64:*)
      pass "libcupti.so is in \$LD_LIBRARY_PATH"
      ;;
    *)
      fail "/usr/apps.sp3/cuda/7.5/extras/CUPTI/lib64 is not in \$LD_LIBRARY_PATH"
      result=1
      ;;
  esac

  return $result
}
