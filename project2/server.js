const http = require('http');

const fs = require('fs');

const path = require('path');

const port = 8000;


http.createServer(function(req, res) {
var filePath = req.url;
if (filePath == '/'){
  filePath = '/index.html';
}
filePath = __dirname+filePath;
var extname = path.extname(filePath);
var contentType = 'text/html';

switch (extname) {
    case '.js':
        contentType = 'text/javascript';
        break;
    case '.css':
        contentType = 'text/css';
        break;
}


fs.exists(filePath, function(exists) {

    if (exists) {
        fs.readFile(filePath, function(error, content) {
            if (error) {
                res.writeHead(500);
                res.end();
            }
            else {
                res.writeHead(200, { 'Content-Type': contentType });
                res.end(content, 'utf-8');
            }
        });
    }
} );

} ).listen(port, function(err) {
	if (err) {
		console.log('Something went wrong', err)
	} else {
		console.log('Server is listening on port ' + port)
	}
});


