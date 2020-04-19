#!/bin/sh

if which stltools >/dev/null
then
  has_stltools=true
fi

resizeX=$1
resizeY=$2
resizeZ=$3

inputFile="$4"
outputFile="$5"

echo "Resizing $inputFile to $resizeX $resizeY $resizeZ -> $outputFile"
echo "scale([$resizeX,$resizeY,$resizeZ]) import(\"$inputFile\");" >"$inputFile.scad"
openscad -q -o "$outputFile" "$inputFile.scad"
rm "$inputFile.scad"

if [ $has_stltools = true ]
then
  stltools binary "$outputFile" "$outputFile.binary.stl"
  rm "$outputFile"
  mv "$outputFile.binary.stl" "$outputFile"
fi

