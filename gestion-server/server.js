'use strict'

const express = require('express')
const app = express()
const routes = require('./routes')
const session = require('express-session')
const cookieParser = require('cookie-parser')
const bodyParser = require('body-parser')
const path = require('path')

app.set('view engine', 'ejs')
app.set('views', path.join(__dirname, 'views'))

app.use(bodyParser.urlencoded({
  extended: false
}))
app.use(bodyParser.json())

app.use(express.static('public'))

app.use('/', routes)

const port = process.env.PORT || 3000
app.listen(port, (err) => {
  if (err) throw err
  console.log('server runnig  http://localhost:3000/')
})
