var express = require("express")

var app = express()
app.set("view engine", "ejs");
app.use(express.static(__dirname + '/public'))

app.get('/', function(req, res) {
   res.render('../public/views/index.ejs')
});

app.get('/statment', function(req, res) {
   res.render('../public/views/SoF.ejs')
});

app.get('/about', function(req, res) {
   res.render('../public/views/about.ejs')
});

app.get('/contact', function(req, res) {
   res.render('../public/views/contact.ejs')
});

app.get('/blog', function(req, res) {
   res.render('../public/views/blog.ejs')
});

app.listen(3000, function(){
   console.log("Blog server is spinning up");
});
