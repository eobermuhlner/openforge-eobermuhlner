These are the internal notes on the operforge-eobermuhlner project.

## `bin` directory

The `bin` directory contains several shell scripts
to automate certain steps in the build process.

- `render.sh` renders *.stl files into *.png

    Usage: `render.sh stl-file [stl-file ...]`

    Example: `render.sh example.stl`

- `resize.sh` resizes a *.stl

    Usage: `resize.sh size-x size-y size-y stl-input-file stl-output-file`

    Example: `resize.sh 0.5 0.5 0.5 example.stl half_size_example.stl`

- `resize_all.sh` resizes some hardcoded *.stl files.

  Must be executed from the root of this project!
  
- `render.sh` renders all *.stl it find in the current directory (recursively).
  The created images are moved into the corresponding `images` directory
  iff the images are different from already existing images.

The scripts depend on certain applications to be installed:
- `openscad` - https://www.openscad.org/
- `magick` - https://imagemagick.org
- `stltools` - https://github.com/eobermuhlner/stl-tools


## Blender

Stones where sculpted using
- OrbBrushes for Blender - https://www.blendswap.com/blend/18735

Most sculpting in Blender is done with the following settings:
- Dyntopo
    - Detailing: Constant Detail
    - Resolution: 5.0
    
After sculpting was finished the object was optimized:
- Decimate modifier
  - Ratio: 0.05 - 0.1
