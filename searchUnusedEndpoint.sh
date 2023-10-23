#!/bin/bash

frontEndDir='../blackcyber-buysmart-landing/src'

for file in $(grep -rn --include routes.js 'router.[A-Za-z]' * | grep -v 'router.routes'); do
    match=$(echo "$file" | grep -o "router.*('\([^']*\)" | sed "s/router.*('//")

    if [ -n "$match" ]; then
        #echo "validating $file found: $match"
        hit=0
        if grep -rn --exclude="*test*" "$match" "$frontEndDir" > /dev/null; then
            ((hit++))
        fi
        if [ "$hit" -eq 0 ]; then
            echo $match " not found"
        fi
        hit=0
    fi

done
