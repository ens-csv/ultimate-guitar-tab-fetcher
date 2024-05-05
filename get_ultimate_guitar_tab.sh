#!/bin/bash

# Check if URL and transpose value are provided as arguments
if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: $0 <ultimate-guitar-tab-url> <transpose-value>"
  exit 1
fi

URL=$1
transpose_value=$2

# Fetch the webpage content
content=$(curl -s "$URL")

# Extract the tab section from the HTML
tabs=$(echo "$content" | sed -n '/<pre/,/<\/pre>/p')

# Clean the tab data by stripping HTML tags
clean_tabs=$(echo "$tabs" | sed 's/<[^>]*>//g')

# Function to transpose the tab numbers
transpose() {
  echo "$1" | sed -E "s/([0-9]+)/echo \$((\1 + $transpose_value))/ge"
}

# Transpose the numbers in the tab
transposed_tabs=$(transpose "$clean_tabs")

# Output the transposed tabs
echo "$transposed_tabs"

