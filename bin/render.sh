#!/bin/sh

for f in *
do
  echo "Rendering $f"
  echo "import(\"$f\", convexity=3);" >"$f.scad"
  openscad -q -o "$f.png" --imgsize 256,256 --colorscheme Tomorrow "$f.scad"
  rm "$f.scad"
done

