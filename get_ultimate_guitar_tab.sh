#!/bin/bash

# A script to fetch and transpose guitar tabs from Ultimate Guitar.

# Check if URL and transpose value are provided
if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: $0 <ultimate-guitar-tab-url> <transpose-value>"
  exit 1
fi

URL=$1
transpose_value=$2

# Fetch the webpage content
content=$(curl -s "$URL")

# Check if the content contains tabs (adjust this if the structure changes)
# Usually, tabs are stored inside 'js-store' or 'pre' tags, but we need to inspect it
tabs=$(echo "$content" | grep -oP '(?<=<pre>).*(?=</pre>)')

if [ -z "$tabs" ]; then
  echo "Could not extract tabs. Check if the URL is correct or if the website structure has changed."
  exit 1
fi

# Clean the tab data by stripping remaining HTML tags (if any)
clean_tabs=$(echo "$tabs" | sed 's/<[^>]*>//g')

# Function to transpose the tab numbers
transpose() {
  echo "$1" | sed -E "s/([0-9]+)/echo \$((\1 + $transpose_value))/ge"
}

# Transpose the numbers in the tab
transposed_tabs=$(transpose "$clean_tabs")

# Output the transposed tabs
echo "$transposed_tabs"

