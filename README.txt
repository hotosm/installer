HOTOSM Installer
----------------

Windows is the most common platform in many places HOTOSM works.

These are a set of scripts to start to pull together a unified Windows
installer for a range of software we are actively deploying in the field.

There are lots of ways to install stuff on windows. This installer takes
the shortcut approach of sticking all stuff into a unixy directory structure.
Then it runs a bat script to put onto PATH both '{program files}\HOTOSM\bin'
and '{program files}\HOTOSM\lib' while automatically putting on the 
PYTHONPATH '{program files}\HOTOSM\python\2.5\site-packages'. There are likely
better ways to do this, but its worked so far.

See the docs/ directory for more details on building and using this
installer.


Goals
=====

The idea here is a one-shot, kitchen-sink approach to make it as
easy as possible for getting a variety of tools running that are
*not otherwise* available as easy to use windows installers.

This is to allow for tools to be ready to run as soon as they are required
by one of the tutorials at:

http://wiki.openstreetmap.org/wiki/Humanitarian_OSM_Team/HOT_Package

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
 * QGIS
 * Postgres/PostGIS
 * Python 2.5
 
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
 * osmosis 1.37
 * mkgmap r1625
 * bzip2
 * wget
 * See the TODO.txt for further tools we plan to consider packaging
