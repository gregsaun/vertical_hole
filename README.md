# Vertical Hole Library for Openscad

When 3D printing vertical holes (with FDM printer), the top of the hole is flat and reduce the hole diameter. This library creates a hole with a specific shape on top to avoid this diameter compression.

![Vertical Hole Shape](img/vertical_hole_shape.png)

With this library, you do not need to clean the hole (drill the hole) after printing :)

## Material used and tested

- Prusa i3 MK2s [Bear upgrade](https://github.com/gregsaun/prusa_i3_bear_upgrade)
- FormFutura PETG HDGlass Blinded Silver (nozzle 230°C, heated bed 80°C)
- Prusa Firmware 3.1.0 with Linear Advance activated and manually calibrated
- Slic3r Prusa Edition 1.37.1

## Status

I am currently testing the perfect shape/sizes. I have only tested 0.20mm layer height with default slic3r PE settings (2 perimeters, 6 top, 5 bottom).

## Sources

- This library as been inspired by the x-axis-end of the Prusa i3 MK2 printer, [check line 79 here](https://github.com/prusa3d/Original-Prusa-i3/blob/2408cbe5b307ca18e2968de5c82fe0842bb4e2a1/Printed-Parts/scad/x-end.scad)

- Why we have this type of hole in FDM, [read this](https://www.3dhubs.com/knowledge-base/how-design-parts-fdm-3d-printing#vertical-axis-holes)

## License

MIT License\
https://choosealicense.com/licenses/mit/