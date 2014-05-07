#!/bin/bash

# ./retrieve_content.sh all.txt

ABSOLUTE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CONTENT_DIR=$ABSOLUTE_DIR/../content
CONTENT_LINKS_DIR=$CONTENT_DIR/links
CONTENT_PROCESSED_DIR=$CONTENT_DIR/files

mkdir -p $CONTENT_PROCESSED_DIR

LINKS=$CONTENT_LINKS_DIR/$1
LINKS=`cat $LINKS`
for LINK in $LINKS ; do
    CHECK=`fgrep -r \"url\":\"$LINK\" $CONTENT_PROCESSED_DIR | wc -l`
    if [ $CHECK -eq 0 ]; then
    $ABSOLUTE_DIR/helpers/retrieve.rb $CONTENT_PROCESSED_DIR $LINK
    echo -n "."
    fi
done

echo
