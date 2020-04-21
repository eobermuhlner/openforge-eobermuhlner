#!/bin/sh

for f in "$@"
do
  echo "Rendering $f"
  echo "import(\"$f\");" >"$f.scad"
  openscad -q -o "$f.png" --imgsize 2048,2048 --colorscheme Tomorrow "$f.scad"
  magick mogrify -geometry 1024x1024 "$f.png"
  rm "$f.scad"
done

