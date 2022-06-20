#!/bin/bash

dir1='js'
dir2='styles'
outdir='./lib/'
function compression () {
    dirlist=`ls $1`
    for file in $dirlist
    do
        if [ ${file##*.} = "js" ]; then
            uglifyjs $1/$file -m -o lib/js/${file%.*}.min.${file##*.}
        fi
        if [ ${file##*.} = "css" ]; then
            cleancss -o lib/styles/${file%.*}.min.${file##*.} $1/$file
        fi
    done
}

compression $dir1
compression $dir2