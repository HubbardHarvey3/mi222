var express = require("express")

var app = express()
app.set("view engine", "ejs");

const CONTACT_ADDRESS = 'hubbard.harvey@hcubedcoder.com';

app.get('/', function(req, res) {
   res.send('Hello World') 
});


app.listen(process.env.PORT, process.env.IP, function(){
   console.log("Blog server is spinning up");
});