#!/bin/bash

# Check if URL is provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <ultimate-guitar-tab-url>"
  exit 1
fi

URL=$1

# Fetch the webpage content
content=$(curl -s "$URL")

# Extract the tab section from the HTML
# Ultimate Guitar uses <pre> tags for tabs, so we will search for those
tabs=$(echo "$content" | sed -n '/<pre/,/<\/pre>/p')

# Clean the tab data by stripping HTML tags
clean_tabs=$(echo "$tabs" | sed 's/<[^>]*>//g')

# Output the cleaned tabs
echo "$clean_tabs"

