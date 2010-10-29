HOTOSM Installer
----------------

Windows is the most common platform in many places HOTOSM works.

These are a set of scripts to start to pull together a unified Windows
installer for a range of software we are actively deploying in the field.

See the docs/ directory for more details on building and using this
installer.


Goals
=====

The idea here is a one-shot, kitchen-sink approach to make it as
easy as possible for getting a variety of tools running that are
*not otherwise* available as easy to use windows installers.

The tools packaged so far are mainly python stuff because Dane Springmeyer,
who deployed with HOT on mission 2, knows python and tends to solve
problems this way. But, one idea behind making this installer public 
is to allow others to recommend tools that might be useful if stuck
into this thingy.



Origins
=======

This started as a standalone Mapnik installer, which is the reason the
'setup.sh' script builds off of the base directory structure from the 
Mapnik windows download. But the longer term goal is to abstract
this out and provide a more generic base to throw in more tools.



Why not OSGEO4W?
================

This installer is an alternative to using OSGEO4W, which is a great tool 
but has certain drawbacks for rapid deployment of tools in the field:

1) OSGEO4W is non-trivial to get working fully-offine (from a usb stick).
2) OSGEO4W is less than "one-click" and requires some explanation to use.
3) OSGEO4W requires a high level of skill to add new packages to.


What is included?
=================

This installer does not package everything! Common tools used by HOTOSM that 
are not provided in this installer are:

 * JOSM / Java runtime
 * GPSBabel
 * Garmin Drivers
 
This installer currently includes:

 * Mapnik 0.7.1 (python 2.5/2.6)
   - installer *only* sets up py2.5 bindings
 * osm2pgsql (and libs) revision 0.69-21289
 * proj4 nad files
   - this ensures mapnik/osm2pgsql can create projections with +init=espg=<code>
 * PIL - python imaging (python 2.5/2.6)
 * lxml (python 2.5/2.6)
 * Cascadenik
 * cssutils
 * nik2img
 * TileLite
 * See the TODO.txt for further tools we plan to consider packaging
