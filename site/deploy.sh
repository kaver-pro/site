#!/bin/sh
rm -rf /var/www/kaver;
mkdir /var/www/kaver;
cd /kaver/kaver/site/ && /usr/share/dotnet/dotnet publish --configuration release -o /var/www/kaver/;