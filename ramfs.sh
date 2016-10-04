#!/bin/sh

self_dir=$(dirname $(readlink -e $0))

pushd ${self_dir}/ramfs
mkdir -p dev lib64 proc sys
find . | cpio -o -H newc | gzip -9 > ${self_dir}/ramfs.gz
popd
