#!/usr/bin/env bash

set -euo pipefail

if [ $# -lt 2 ]; then
  echo "require: file, project_id"
  exit 1
fi
file=$1
project=$2

delimiter=","
if [ $# -ge 3 ]; then
  delimiter=$3
fi

cat $file | while read line; do
  key=$(echo $line | cut -d $delimiter -f 1)
  val=$(echo $line | cut -d $delimiter -f 2)

  berglas create sm://$project/$key $val
done
