var request = require('request'),
    cheerio =require('cheerio'),
    urls= [];
    
request('https://www.reddit.com',function(err, resp, body){
    if(!err && resp.statusCode == 200){
        var $ = cheerio.load(body);
        $('a.title', '#siteTable').each(function(){
            var url = $(this).attr('href');
            urls.push(url);
        });
        console.log(urls);
    }
});