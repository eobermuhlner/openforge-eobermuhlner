#!/bin/sh

for f in "$@"
do
  echo "Rendering $f"
  echo "import(\"$f\");" >"$f.scad"
  openscad -q -o "$f.png" --imgsize 512,512 --colorscheme Tomorrow "$f.scad"
  magick mogrify -geometry 256x256 "$f.png"
  rm "$f.scad"
done

