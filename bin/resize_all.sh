#!/bin/sh

if which stltools >/dev/null
then
  has_stltools=true
fi

resize_stl()
{
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
}

resize_2x2_to_1x1() {
  resize_stl 0.5 0.5 1.0 $1.2x2.stl $1.1x1.stl
}

resize_2x2_to_3x3() {
  resize_stl 1.5 1.5 1.0 $1.2x2.stl $1.3x3.stl
}

resize_2x2_to_4x4() {
  resize_stl 2.0 2.0 1.0 $1.2x2.stl $1.4x4.stl
}

resize_2x2_to_1x1_half() {
  resize_stl 0.5 0.5 0.5 $1.2x2.stl $1.1x1.stl
}

resize_from_2x2() {
  resize_2x2_to_1x1 $1
  resize_2x2_to_3x3 $1
  resize_2x2_to_4x4 $1
}

pushd circle-insets/stl

#resize_from_2x2 circle_inset.circle_magic1_rough_stone.inch
#resize_from_2x2 circle_inset.circle_magic2_rough_stone.inch
#resize_from_2x2 circle_inset.circle_magic1_smooth.inch
#resize_from_2x2 circle_inset.circle_magic2_rough_stone.inch
#resize_from_2x2 circle_inset.circle_magic2_smooth.inch
#resize_from_2x2 circle_inset.circle_mosaic_smooth_stone.inch
#resize_from_2x2 circle_inset.circle_pentagram_rough_stone.inch
#resize_from_2x2 circle_inset.circle_pentagram_smooth.inch
#resize_from_2x2 circle_inset.circle_pentagram_smooth_stone.inch
#resize_from_2x2 circle_inset.circle_rough_stone.inch
#resize_from_2x2 circle_inset.circle_smooth.inch
resize_from_2x2 circle_inset.bathtub_wood.inch

popd