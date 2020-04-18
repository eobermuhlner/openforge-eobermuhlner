#!/bin/sh

resize_2x2_to_1x1() {
  ../../bin/resize.sh 0.5 0.5 1.0 $1.2x2.stl $1.1x1.stl
}

resize_2x2_to_3x3() {
  ../../bin/resize.sh 1.5 1.5 1.0 $1.2x2.stl $1.3x3.stl
}

resize_2x2_to_4x4() {
  ../../bin/resize.sh 2.0 2.0 1.0 $1.2x2.stl $1.4x4.stl
}

resize_2x2_to_1x1_half() {
  ../../bin/resize.sh 0.5 0.5 0.5 $1.2x2.stl $1.1x1.stl
}

resize() {
  resize_2x2_to_1x1 $1
  resize_2x2_to_3x3 $1
  resize_2x2_to_4x4 $1
}

resize_2x2_to_1x1_half circle_inset.circle_cage_rough_stone.inch
resize_2x2_to_3x3 circle_inset.circle_cage_rough_stone.inch
resize_2x2_to_4x4 circle_inset.circle_cage_rough_stone.inch

resize circle_inset.circle_magic1_rough_stone.inch
resize circle_inset.circle_magic2_rough_stone.inch
resize circle_inset.circle_magic1_smooth.inch
resize circle_inset.circle_magic2_rough_stone.inch
resize circle_inset.circle_magic2_smooth.inch
resize circle_inset.circle_mosaic_smooth_stone.inch
resize circle_inset.circle_pentagram_rough_stone.inch
resize circle_inset.circle_pentagram_smooth.inch
resize circle_inset.circle_pentagram_smooth_stone.inch
resize circle_inset.circle_rough_stone.inch
resize circle_inset.circle_smooth.inch

