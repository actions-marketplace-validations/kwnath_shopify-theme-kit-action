#!/bin/sh

output=$(theme $1 $2)
method=$1
branchName=$3

if [ "$1" == "get" ] && [ "$branchName" ]; then
  echo "branch test: $branchName"
  branch=$($branchName | sed 's/\//-/g')
  echo "new branch: $branch"
  themeId=$($output | grep "\[$branch\]" | xargs | grep -Eo "\[(\d+?)]" | cut -d "[" -f 2 | cut -d "]" -f -1)
  echo "themeId: $themeId"
  echo "::set-output name=themeId::$themeId"
fi



echo "::set-output name=result::$output"
