#! /bin/sh

# Uboot use bmp3 bitmap format with the basic 16 bits palette + 240 of custom
palette=256
convert -background black -alpha remove $1 w-$1
convert w-$1 -colors $palette -depth 8 -compress none  $1.bmp3
rm -f w-$1
mv $1.bmp3 $1.bmp

