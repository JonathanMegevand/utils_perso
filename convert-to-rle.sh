#! /bin/sh
convert -depth 8 $1 rgb:splash.raw
to565 -rle < splash.raw > initlogo.rle
rm -f splash.raw
#convert logo.png -colors 256 -depth 8 -compress none logo.bmp3
