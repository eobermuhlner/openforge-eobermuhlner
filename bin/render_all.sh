#!/bin/sh

imageDir="../images"

if which magick >/dev/null
then
  has_magick=true
fi

for f in `find . -name *.stl`
do
  echo "Rendering $f"
  sourceDir=`dirname $f`
  sourceFile=`basename $f`

  pushd "$sourceDir" >/dev/null

  echo "import(\"$sourceFile\");" >"$sourceFile.scad"
  openscad -q -o "$sourceFile.png" --imgsize 512,512 --colorscheme Tomorrow "$sourceFile.scad"
  if [ $has_magick = true ]
  then
    magick mogrify -geometry 256x256 "$sourceFile.png"
  fi
  rm "$sourceFile.scad"

  if [ -d  "$imageDir" ]
  then
    if [ -f "$imageDir/$sourceFile.png" ]
    then
      if magick compare -metric ae "$sourceFile.png" "$imageDir/$sourceFile.png" difference.png 2>/dev/null
      then
        echo "Same image already exists - deleting it"
        rm "$sourceFile.png"
      else
        echo "Different image already exists - moving it over"
        mv "$sourceFile.png" "$imageDir"
      fi

      if [ -f difference.png ]
      then

        rm difference.png
      fi
    else
      echo "No image exists - moving it"
      mv "$sourceFile.png" "$imageDir"
    fi
  fi

  popd >/dev/null
done

