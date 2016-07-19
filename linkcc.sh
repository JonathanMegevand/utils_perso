#!/bin/bash
for file in `ls`; do
        if [[ "$file" == "link" ]]; then
                continue
        fi
        # uncomment for v5
        echo $file
        ln -s $file ${file#arm-unknown-linux-gnueabi-}
        ln -s $file armv5tel-unknown-linux-gnueabi-${file#arm-unknown-linux-gnueabi-}
        # uncomment for v6
        # ln -s $file ${file#arm-unknown-linux-gnueabihf-}
        # ln -s $file armv6l-unknown-linux-gnueabihf-${file#arm-unknown-linux-gnueabihf-}
        # uncomment for v7
        # ln -s $file ${file#arm-unknown-linux-gnueabihf-}
        # ln -s $file armv7l-unknown-linux-gnueabihf-${file#arm-unknown-linux-gnueabihf-}
done