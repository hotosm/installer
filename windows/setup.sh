#!/bin/sh

# make a directory for downloads

DOWNLOADS=downloads
mkdir $DOWNLOADS

# grab mapnik
VER=0.7.1
echo 'downloading mapnik... '$VER
wget http://download.berlios.de/mapnik/mapnik-$VER-win32-py25_26.zip
# unzip
unzip mapnik-$VER-win32-py25_26.zip
mv mapnik-$VER-win32-py25_26.zip $DOWNLOADS/
# above command creates the $TARGET directory which we stash all things in
cd $DOWNLOADS
TARGET="../mapnik-0.7.1"


# get osm2pgsql
echo 'downloading osm2pgsql..'
wget http://tile.openstreetmap.org/osm2pgsql.zip
# unzip
unzip osm2pgsql.zip
# copy to binary
mv osm2pgsql/osm2pgsql.exe $TARGET/bin/
# copy the libs
mv osm2pgsql/*dll $TARGET/lib
# create a data share dir
mkdir $TARGET/share
mv osm2pgsql/*style $TARGET/share
mv osm2pgsql/*sql $TARGET/share
# cleanup
rm -rf osm2pgsql

# proj4
VER=446
echo 'downloading proj4... '$VER
wget http://download.osgeo.org/proj/proj$VER_win32_bin.zip
# unzip
unzip proj$VER_win32_bin.zip
# place nad in dir that installer expects
mv proj/nad/ $TARGET/
echo '# WGS 84 / Pseudo-Mercator' >> $TARGET/nad/epsg
echo '<3857> +proj=merc +a=6378137 +b=6378137 +lat_ts=0.0 +lon_0=0.0 +x_0=0.0 +y_0=0 +k=1.0 +units=m +nadgrids=@null +wktext  +no_defs <>' >> $TARGET/nad/epsg
echo '# Google Mercator (basically the same as 3857) but with +over added' >> $TARGET/nad/epsg
echo '<900913> +proj=merc +a=6378137 +b=6378137 +lat_ts=0.0 +lon_0=0.0 +x_0=0.0 +y_0=0 +k=1.0 +units=m +nadgrids=@null +no_defs +over <>' >> $TARGET/nad/epsg
# cleanup
rm -rf proj

# cascadenik and deps
VER=0.1.0
echo 'downloading cascadenik..'$VER
wget http://pypi.python.org/packages/source/c/cascadenik/cascadenik-$VER.tar.gz#md5=efe51497e4757977516958e409e70c53
tar xvf cascadenik-$VER.tar.gz
mv cascadenik-$VER/cascadenik-*
mv cascadenik-$VER/cascadenik-* $TARGET/bin/
# note, no trailing slash on source 'cascadenik-0.1.0/cascadenik' folder
cp -R cascadenik-$VER/cascadenik $TARGET/python/2.5/site-packages/
cp -R cascadenik-$VER/cascadenik $TARGET/python/2.6/site-packages/
rm -rf cascadenik-$VER

VER=0.9.7b3
echo 'downloading cssutils..'$VER
wget http://pypi.python.org/packages/source/c/cssutils/cssutils-$VER.zip#md5=4539c061bb03612cc3a0e278c44e8f96
unzip cssutils-$VER.zip
cp -R cssutils-$VER/src/cssutils $TARGET/python/2.5/site-packages/
cp -R cssutils-$VER/src/encutils $TARGET/python/2.5/site-packages/
cp -R cssutils-$VER/src/cssutils $TARGET/python/2.6/site-packages/
cp -R cssutils-$VER/src/encutils $TARGET/python/2.6/site-packages/
rm -rf cssutils-$VER

# can't believe this works on osx!
VER=1.1.7
echo 'downloading python imaging library..'$VER
wget http://effbot.org/downloads/PIL-$VER.win32-py2.5.exe
unzip -L PIL-$VER.win32-py2.5.exe -d PIL25
mv PIL25/platlib/pil* $TARGET/python/2.5/site-packages/
# copy py25 scripts
mv PIL25/scripts/pilconvert.py $TARGET/bin/pilconvert25.py
mv PIL25/scripts/pildriver.py $TARGET/bin/pildriver25.py
mv PIL25/scripts/pilfile.py $TARGET/bin/pilfile25.py
mv PIL25/scripts/pilfont.py $TARGET/bin/pilfont25.py
mv PIL25/scripts/pilprint.py $TARGET/bin/pilprint25.py
rm -rf PIL25

wget http://effbot.org/downloads/PIL-$VER.win32-py2.6.exe
unzip -L PIL-$VER.win32-py2.5.exe -d PIL26
mv PIL26/platlib/pil* $TARGET/python/2.6/site-packages/
# copy py26 scripts
mv PIL26/scripts/pilconvert.py $TARGET/bin/pilconvert26.py
mv PIL26/scripts/pildriver.py $TARGET/bin/pildriver26.py
mv PIL26/scripts/pilfile.py $TARGET/bin/pilfile26.py
mv PIL26/scripts/pilfont.py $TARGET/bin/pilfont26.py
mv PIL26/scripts/pilprint.py $TARGET/bin/pilprint26.py
rm -rf PIL26

# lxml
# py25
VER=2.2.6
echo 'downloading lxml (for python 25)..'$VER
wget http://pypi.python.org/packages/2.5/l/lxml/lxml-$VER.win32-py2.5.exe#md5=5824f195b457bb8b613d0369a54ccc70
unzip -L lxml-2.2.6.win32-py2.5.exe -d lxml25
mv lxml25/platlib/lxml $TARGET/python/2.5/site-packages/
rm -rf xml25

#py26
VER=2.2.8
echo 'downloading lxml (for python26)..'$VER
wget http://pypi.python.org/packages/2.6/l/lxml/lxml-$VER.win32-py2.6.exe#md5=18a7e134fc6eeda498068ece7f1656ef
unzip -L lxml-2.2.8.win32-py2.6.exe -d lxml26
mv lxml26/platlib/lxml $TARGET/python/2.6/site-packages/
rm -rf xml26

# nik2img
echo 'downloading nik2img trunk..'
svn co http://mapnik-utils.googlecode.com/svn/trunk/nik2img/ nik2img-svn
cp -R nik2img-svn/mapnik_utils $TARGET/python/2.5/site-packages/
cp -R nik2img-svn/mapnik_utils $TARGET/python/2.6/site-packages/
mv nik2img-svn/nik2img.py $TARGET/bin/
rm -rf nik2img-svn

# tilelite
echo 'downloading tilelite tip..'
hg clone http://bitbucket.org/springmeyer/tilelite
cp tilelite/liteserv.py $TARGET/bin/
cp tilelite/tilelite.py $TARGET/python/2.5/site-packages/
cp tilelite/tilelite.py $TARGET/python/2.6/site-packages/
rm -rf tilelite

# werzeug - better wsgi server for tilelite
VER=0.6.2
echo 'downloading werkzeug (for tilelite)..'$VER
wget http://pypi.python.org/packages/source/W/Werkzeug/Werkzeug-$VER.tar.gz
tar xvf Werkzeug-$VER.tar.gz
cp -R Werkzeug-$VER/werkzeug $TARGET/python/2.5/site-packages/
cp -R Werkzeug-$VER/werkzeug $TARGET/python/2.6/site-packages/
rm -rf Werkzeug-$VER

# cleanup all svn data
cd $TARGET
find . -name '.svn' -exec rm -rf {} \;
cd ../