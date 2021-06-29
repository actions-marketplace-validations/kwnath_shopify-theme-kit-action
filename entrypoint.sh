#!/bin/sh

output=$(theme $1 $2)

echo "::set-output name=result::$output"
