#!/bin/sh

for f in `find . -name *.scad`
do
  echo "Running $f"

  sourceDir=`dirname $f`
  sourceFile=`basename $f`

  pushd "$sourceDir" >/dev/null

  if [ `basename "$sourceDir"` = "scad" -a -d ../stl ]
  then
    targetFile=`basename $f .scad`

    cp "$sourceFile" ../stl
    pushd ../stl >/dev/null

    openscad -o "$targetFile" "$sourceFile"

    rm "$sourceFile"
    popd >/dev/null
  else
    echo "Scad file not in scad directory and no matching stl directory found: $f"
  fi

  popd >/dev/null
done