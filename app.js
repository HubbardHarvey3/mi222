const express = require("express")
const nodemailer = require('nodemailer')


var app = express()
var port = process.env.PORT || 3000



app.set("view engine", "ejs");
app.use(express.static(__dirname + '/public'))
app.use(require('body-parser').urlencoded());


// console.log(secret.process.env.USER)
// Email Stuff

let mailer = require('nodemailer').createTransport({
  host: 'smtp.zoho.com',
  port: 465,
  secure: true,
  auth: {
    user:process.env.USER,
    pass: process.env.PASSWORD
  }
})

app.post ('/contact', function(req,res){
  console.log("Message Sent: " + req.body.sender+ " " + req.body.message);
  mailer.sendMail({
    from:process.env.USER,
    to:process.env.USER,
    message:req.body.message,
    subject:req.body.sender,
    html:req.body.message,
  }), function(err, info){
    if (err) return res.status(500).send(err);
    res.json({success: true});
  }
  res.render('../public/views/index.ejs')
});

// ROUTES
app.get('/', function(req, res) {
   res.render('../public/views/index.ejs')
});

app.get('/statement', function(req, res) {
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

app.listen(port, function(){
   console.log("Blog server is spinning up");
});
