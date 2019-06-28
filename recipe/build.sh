#!/bin/bash
set -euo pipefail

mkdir build
cd build

cmake -G "Unix Makefiles" -D ENABLE_DRAFTS=ON -D WITH_PERF_TOOL=OFF -D ZMQ_BUILD_TESTS=ON -D ENABLE_CPACK=OFF -D WITH_LIBSODIUM=OFF -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=$PREFIX ..

make -j${CPU_COUNT}

make test
make install
