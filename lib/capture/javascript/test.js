var page = require('webpage').create();
page.open('http://www.bbc.co.uk/news', function () {
    console.log(page.content);
    phantom.exit();
});
