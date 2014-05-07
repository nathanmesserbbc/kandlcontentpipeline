#!/bin/bash

# ./analyse_data.sh

ABSOLUTE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

RECOMMENDATIONS_DIR=$ABSOLUTE_DIR/../recommendations
RECOMMENDATIONS_FILES_DIR=$RECOMMENDATIONS_DIR/files
RECOMMENDATIONS_PROCESSED_DIR=$RECOMMENDATIONS_DIR/processed

mkdir -p $RECOMMENDATIONS_PROCESSED_DIR
rm -rf $RECOMMENDATIONS_PROCESSED_DIR/*

mahout seqdirectory -c UTF-8 -i $RECOMMENDATIONS_FILES_DIR -o $RECOMMENDATIONS_PROCESSED_DIR/seqfiles -xm sequential
mahout seq2sparse -i $RECOMMENDATIONS_PROCESSED_DIR/seqfiles -o $RECOMMENDATIONS_PROCESSED_DIR/vectors -ow -chunk 100 -x 90 -seq -ml 50 -n 2 -s 5 -md 5 -ng 3 -nv
mahout rowid -i $RECOMMENDATIONS_PROCESSED_DIR/vectors/tfidf-vectors/part-r-00000 -o $RECOMMENDATIONS_PROCESSED_DIR/matrix
mahout rowsimilarity -i $RECOMMENDATIONS_PROCESSED_DIR/matrix/matrix -o $RECOMMENDATIONS_PROCESSED_DIR/similarity --similarityClassname SIMILARITY_COSINE -m 10 -ess
mahout seqdumper -i $RECOMMENDATIONS_PROCESSED_DIR/similarity > $RECOMMENDATIONS_PROCESSED_DIR/similarity.txt
mahout seqdumper -i $RECOMMENDATIONS_PROCESSED_DIR/matrix/docIndex > $RECOMMENDATIONS_PROCESSED_DIR/docIndex.txt
rm -rf temp
