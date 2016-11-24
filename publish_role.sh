#!/bin/sh

CURRENT_ROLE=`cat metadata.rb | grep "name '" | awk -F"'" '$0=$2'`
knife cookbook site share "${CURRENT_ROLE}" "other"  -o $PWD/../ -c ~/.chef/knife_sa.rb -VV
