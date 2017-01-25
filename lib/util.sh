#!/bin/bash

function pass {
  echo -e "\e[1;32m✓ $@\e[0m" 
}

function fail {
  echo -e "\e[1;31m✗ $@\e[0m"
}

