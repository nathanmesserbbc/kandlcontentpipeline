#!/bin/bash

# ./retrieve_links.sh arts

ABSOLUTE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

CONTENT_DIR=$ABSOLUTE_DIR/../content
LINKS_DIR=$CONTENT_DIR/links

mkdir -p $LINKS_DIR
cd $LINKS_DIR

google_scraper "site:www.bbc.co.uk/$1"
mv output.csv $1.temp
cat $1.temp | cut -d, -f1 > $LINKS_DIR/$1.temp.csv
sed '1d' $LINKS_DIR/$1.temp.csv | sort | uniq > $LINKS_DIR/$1.csv

rm $LINKS_DIR/$1.temp
rm $LINKS_DIR/$1.temp.csv
