#!/bin/sh

output=$(theme $1 $2)

if $3; then
    branch=$($3 | sed 's/\//-/g')
    themeId=$(theme get --list | grep "\[$branch\]" | xargs | grep -Eo "\[(\d+?)]" | cut -d "[" -f 2 | cut -d "]" -f -1)
fi

echo "::set-output name=result::$output"
echo "::set-output name=themeId::$themeId"
