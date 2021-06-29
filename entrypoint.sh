#!/bin/sh

output=$(theme $1 $2)

echo "branch test: $3"
branch=$($3 | sed 's/\//-/g')
echo "branch: $branch"
themeId=$($output | grep "\[$branch\]" | xargs | grep -Eo "\[(\d+?)]" | cut -d "[" -f 2 | cut -d "]" -f -1)
echo "branch: $branch"
echo "themeId: $themeId"

echo "::set-output name=themeId::$themeId"


echo "::set-output name=result::$output"
