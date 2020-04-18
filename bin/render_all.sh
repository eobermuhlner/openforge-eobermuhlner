#!/bin/sh

imageDir="../images"

for f in `find . -name *.stl`
do
  echo "Rendering $f"
  sourceDir=`dirname $f`
  sourceFile=`basename $f`

  pushd "$sourceDir" >/dev/null

  echo "import(\"$sourceFile\");" >"$sourceFile.scad"
  openscad -q -o "$sourceFile.png" --imgsize 512,512 --colorscheme Tomorrow "$sourceFile.scad"
  magick mogrify -geometry 256x256 "$sourceFile.png"
  rm "$sourceFile.scad"

  if [ -d  "$imageDir" ]
  then
    mv "$sourceFile.png" "$imageDir"
  fi

  popd >/dev/null
done

