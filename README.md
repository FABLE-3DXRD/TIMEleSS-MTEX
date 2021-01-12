# TIMEleSS-Matlab

TIMEleSS

Sébastien Merkel
sebastien.merkel@univ-lille.fr


This is the source code for TIMEleSS matlab plotting tools.

TIMEleSS is a joint French-German research project funded by ANR and DFG between the Université de Lille, the Westfälische Wilhelms-Universität, Münster, and the Deutsche GeoForschungsZentrum, Potsdam. 

TIMEleSS includes data collection using multigrain crystallography in the diamond anvil cell. This packqge is meant to hold the various scripts we use and make them available to the community.

Information on TIMEleSS: http://timeless.texture.rocks/

## Main functions

These functions are meant to plot grain orientations (pole figures, inverse pole figures) using MTeX. For more about MTeX, have a look at the MTeX homepage at https://mtex-toolbox.github.io/

The TIMEleSS matlab plotting tools will
 * load a collection of orientations from a 3D-XRD indexing
 * fit an ODF to the orientation list
 * plot pole figures and inverse pole figures, coloring the points according to the pole figure, inverse pole figure, or ODF intensity.
 
The main codes are [plotOrientationsIPF.m](plotOrientationsIPF.m) for plotting inverse pole figures, and [plotOrientationsPF.m](plotOrientationsPF.m) for plotting  pole figures. There are a few examples at the top of each file.

In all examples 'ss' is sample symmetry and 'cs' are crystal symmetry, as commonly used in MTeX. They need to be defined before loading orientations.
