#!/bin/bash

# ./mahout_transform.sh

ABSOLUTE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

CONTENT_DIR=$ABSOLUTE_DIR/../content
CONTENT_PROCESSED_DIR=$CONTENT_DIR/processed

RECOMMENDATIONS_DIR=$ABSOLUTE_DIR/../recommendations
RECOMMENDATIONS_FILES_DIR=$RECOMMENDATIONS_DIR/files

mkdir -p $RECOMMENDATIONS_FILES_DIR
rm -rf $RECOMMENDATIONS_FILES_DIR/*

for FILE in $CONTENT_PROCESSED_DIR/*
do
$ABSOLUTE_DIR/helpers/mahout_transform.rb $RECOMMENDATIONS_FILES_DIR $FILE
echo -n "."
done

echo
