#!/bin/sh

output=$(theme $1 $2)


getThemeId() {
    themeId="$(theme get --list | grep "\[$1\]" | xargs | grep -Eo "\[(\d+?)]" | cut -d "[" -f 2 | cut -d "]" -f -1)"
    echo $themeId
}
branch=$($3 | sed 's/\//-/g')
themeId=$(getThemeId $branch)

echo "::set-output name=result::$output"
echo "::set-output name=themeId::$themeId"
