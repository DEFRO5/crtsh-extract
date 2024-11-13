#!/bin/bash
echo "Processing..."
while IFS= read -r target; do
    result=$(curl -s "https://crt.sh/?q=%.$target&output=json" | jq -r '.[].name_value' | sed 's/\*\.//g' | sort -u)
    # Print the result to the terminal
    echo "$result" >crt-url.txt
done < url.txt
echo "Done!"
