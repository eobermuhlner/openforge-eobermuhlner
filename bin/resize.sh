#!/bin/sh

resizeX=$1
resizeY=$2
resizeZ=$3

inputFile="$4"
outputFile="$5"

echo "Resizing $inputFile to $resizeX $resizeY $resizeZ -> $outputFile"
echo "scale([$resizeX,$resizeY,$resizeZ]) import(\"$inputFile\");" >"$inputFile.scad"
openscad -q -o "$outputFile" "$inputFile.scad"
rm "$inputFile.scad"

