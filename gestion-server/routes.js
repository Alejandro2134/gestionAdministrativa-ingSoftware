'use strict'

const express = require('express')
const router = express.Router()
const db = require('gestionbd')

router.get('/', (req, res) => {
  res.render('pages/index')
})

router.get('/login', (req, res) => {
  res.render('pages/login')
})

module.exports = router
