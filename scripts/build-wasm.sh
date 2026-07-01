#!/usr/bin/env bash
set -e

command -v ninja >/dev/null || {
  echo "ninja is not installed"
  exit 1
}
command -v cmake >/dev/null || {
  echo "cmake is not installed"
  exit 1
}

./emsdk/emsdk install latest
./emsdk/emsdk activate latest
source ./emsdk/emsdk_env.sh

emcmake cmake -B build-wasm -G Ninja \
  -DCMAKE_BUILD_TYPE=Release

cmake --build build-wasm