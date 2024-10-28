#!/bin/bash
rm -rf /var/www/kaver;
mkdir /var/www/kaver;
cd /kaver/site/site/ && dotnet publish --configuration release -o /var/www/kaver/;
