#!/bin/bash
#
# Script to generate a bootanimation
# like this
# -> zip bootanimation -0 desc.txt part0 part1 part2
#
#find . -type f -iname '*.png' -exec echo {} \+
#find . -type f -iname '*.png' | sed 's/^..//g' -exec convert {} -colors 255 i255-{} \;

#convert sample.png -colors 255 output.png

function converter-part-ima {
        part="${1%/}"
	echo Taking care of "$part"
	resd=$dir/$part
	mkdir -p $resd
  
	for file in $part/*.png; do #in this dir
          file=${file##*/}

	  if [ ! -f "$part/$file" ]; then
		continue
          fi
	  echo Converting $file
	  convert -background black -alpha remove $part/$file $resd/w-$file
	  convert  $resd/w-$file -colors 255  $resd/i255-$file
          convert $resd/i255-$file -resize 600x600 $resd/i255-$file
	  rm $resd/w-$file 
	  chmod 775 $resd/i255-$file
	done
}

dir=auto_gen_animation
rm -Rf $dir
rm -f bootanimation.zip

zip bootanimation -0 desc.txt

for folder in */ ; do
        folder="${folder%/}"
	echo Lookup directory $folder
	if [[ "$folder" =~ "part" ]]; then
	    converter-part-ima $folder
	else
	    echo "fail"
	fi
        cd $dir
        zip -0 -u -r ../bootanimation $folder
        cd ..
done

rm -Rf $dir

# Test on the board TODO
adb remount
adb shell rm /system/media/bootanimation.zip
adb push bootanimation.zip  /system/media/bootanimation.zip
adb shell sync
adb shell reboot





