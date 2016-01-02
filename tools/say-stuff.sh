#!/bin/bash

# brew install ffmpeg --with-fdk-aac --with-ffplay --with-freetype --with-libass --with-libquvi --with-libvorbis --with-libvpx --with-opus --with-x265  --with-opencore-amr
# brew install ffmpeg --with-opencore-amr

# set -x

# usage:
# bin/upload-image.sh path/to/file

outdir='media/uploads/voice'


function sayIt {

    text=$1
    outfile=$outdir/$2.aiff
    echo $outfile $text
    say -v Alex -o $outfile $text

    rename=${outfile/.aiff/.amr}
    ffmpeg -i $outfile -ar 8000 -ab 12.2k $rename
}


sayIt "Can I help you?" can-i-help-you
sayIt "Would you like to check in?" like-to-checkin

