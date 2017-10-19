'use strict';

const express = require('express');
const mongo = require('mongodb');

// Constants
const PORT = 8080;
const HOST = '0.0.0.0';
const MONGO_URL = process.env.MONGO_URI;
const app = express();


// App
app.set('view engine', 'ejs')

var mongoClient = require('mongodb').MongoClient;
var db
mongoClient.connect(MONGO_URL, (err, database) => {
  if (err) return console.log(err)
  
  db = database
})

app.get('/', (req, res) => {
  db.collection('city').find().toArray(function(err, results) {
    res.render('index.ejs', {cities: results})
  })
})

//Init Node.JS
app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);