Ultimate Guitar Tab Fetcher & Transposer (Puppeteer Edition)

A Node.js script using Puppeteer to fetch guitar tabs from Ultimate Guitar and transpose the tab numbers by a given value.
Features

    Fetches guitar tabs from a specified Ultimate Guitar URL.
    Removes HTML tags and extracts only the tab content.
    Transposes the tab numbers up or down by a specified value.
    Uses Puppeteer to handle dynamic content loaded via JavaScript.

Prerequisites

Ensure you have the following installed:

    Node.js (v14 or higher)
    npm (comes with Node.js)

Installation

    Clone this repository:

    bash

git clone https://github.com/yourusername/ultimate-guitar-tab-fetcher.git

Navigate to the project directory:

bash

cd ultimate-guitar-tab-fetcher

Install the necessary dependencies:

bash

    npm install puppeteer

Usage

Run the script with the following syntax:

bash

node puppeteer-script.js <ultimate-guitar-tab-url> <transpose-value>

Example

To fetch a tab and increase all tab numbers by 2:

bash

node puppeteer-script.js https://tabs.ultimate-guitar.com/tab/artist/song-id 2

To decrease the tab numbers by 3:

bash

node puppeteer-script.js https://tabs.ultimate-guitar.com/tab/artist/song-id -3

Example Output

lua

E|--------------------|
B|----3---------------|
G|--------2-----------|
D|--------------------|
A|--------------------|
E|--------------------|

After running with a transpose value of +2, the output becomes:

lua

E|--------------------|
B|----5---------------|
G|--------4-----------|
D|--------------------|
A|--------------------|
E|--------------------|

How It Works

    Puppeteer Launch: The script launches a headless Chromium browser to interact with Ultimate Guitar.
    Tab Content Extraction: It selects the tab content from the .js-tab-content pre tag.
    Tab Transposition: A regular expression is used to find all numeric values in the tab and add or subtract the specified transpose value.
    Output: The transposed tab content is printed to the console.

Troubleshooting

    No Tabs Extracted: If no tabs are extracted, the structure of Ultimate Guitar’s webpage might have changed. You may need to inspect the page manually to adjust the selector used in the script.
    Puppeteer Headless Errors: Make sure you’re using a version of Node.js supported by Puppeteer (v14 or higher).

Contributing

Feel free to submit issues and pull requests if you'd like to contribute to the project. Contributions to improve the script’s efficiency, add features, or fix bugs are welcome!
License

This project is licensed under the MIT License - see the LICENSE file for details.
