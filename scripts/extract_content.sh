#!/bin/bash

# ./extract_content.sh

ABSOLUTE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CONTENT_DIR=$ABSOLUTE_DIR/../content
CONTENT_LINKS_DIR=$CONTENT_DIR/links
CONTENT_FILES_DIR=$CONTENT_DIR/files

CONTENT_PROCESSED_DIR=$CONTENT_DIR/processed

mkdir -p $CONTENT_PROCESSED_DIR

for LINK in $CONTENT_FILES_DIR/* ; do
    ID=`basename $LINK`
    if [ ! -f $CONTENT_PROCESSED_DIR/$ID ]; then
    $ABSOLUTE_DIR/helpers/extract.rb $CONTENT_PROCESSED_DIR $LINK
    echo -n "."
    fi
done

echo
