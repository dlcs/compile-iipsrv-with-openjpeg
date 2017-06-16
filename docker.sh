#!/usr/bin/env sh

cd /export

echo Copying /opt/openjpeg to /export/openjpeg ...
mkdir -p /export/openjpeg && cp -R /opt/openjpeg .

echo Copying /opt/iipsrv to /export/iipsrv ...
mkdir -p /export/iipsrv && cp -R /opt/iipsrv .
