const http = require('http')

const fs = require('fs')

const port = 8000;

const server = http.createServer(function(req, res) {

	switch(req.url) {

		case "styles.css" :

			res.writeHead(200, { 'Content-Type': 'text/css' })

			fs.readFile('styles.css', function(err, data) {

				if(err) {
					res.writeHead(404)
					res.write('Error: File not found')
				}else {
					res.write(data)
				}
				res.end()
			})

		break;

		default:
			res.writeHead(200, {'Content-Type': 'text/html' })

			fs.readFile('index.html', function(err, data) {

				if(err) {
					res.writeHead(404)
					res.write('Error: file not found')
				}else{
					res.write(data)
				}
				res.end()
			})
	}

})

server.listen(port, function(err) {
	if (err) {
		console.log('Something went wrong', err)
	} else {
		console.log('Server is listening on port ' + port)
	}
})


