#!/bin/bash
#
# Script to indent file

function converter-indent {
	ext=$1
	for file in *.$ext; do #in this dir
		echo Converting $ext $file
		if [ ! -f "$file" ]; then
			continue
		fi
		indent -linux $file
	done
}

converter-indent h
converter-indent c
converter-indent cpp
