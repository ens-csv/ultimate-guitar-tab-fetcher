const puppeteer = require('puppeteer');

async function scrapeTabs(url, transposeValue) {
  const browser = await puppeteer.launch();
  const page = await browser.newPage();

  // Go to the specified URL
  await page.goto(url, { waitUntil: 'networkidle2' });

  // Log the page content to help identify the tab location
  // Uncomment the following line if you need to see the full page content
  // const content = await page.content();
  // console.log(content);

  // Wait for the tab content to load and extract it
  const tabs = await page.evaluate(() => {
    // Try selecting the tab content within any <code>, <pre>, or <div> tag
    const tabElement = document.querySelector('.js-tab-content') ||
                       document.querySelector('pre') ||
                       document.querySelector('code') ||
                       document.querySelector('div');
    
    // Return the inner text if the tab content exists
    return tabElement ? tabElement.innerText : null;
  });

  if (!tabs) {
    console.log("Could not extract tabs. The structure of the page may have changed.");
    await browser.close();
    return;
  }

  // Transpose the tabs
  const transposedTabs = transposeTabs(tabs, transposeValue);

  // Print the transposed tabs
  console.log(transposedTabs);

  await browser.close();
}

// Function to transpose the tab numbers
function transposeTabs(tabs, transposeValue) {
  return tabs.replace(/\d+/g, (match) => {
    return parseInt(match) + parseInt(transposeValue);
  });
}

// Example usage:
const url = process.argv[2]; // Get the URL from command-line arguments
const transposeValue = process.argv[3]

