#!/bin/bash

# ./load_data.sh

ABSOLUTE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ROOT_DIR=$ABSOLUTE_DIR/../../

cd $ROOT_DIR
rake db:reset
rake load
