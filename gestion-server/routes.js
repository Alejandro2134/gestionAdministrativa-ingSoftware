'use strict'

const express = require('express')
const router = express.Router()
const db = require('gestion-db')

router.get('/', (req, res) => {
  res.render('pages/index')
})

router.get('/login', (req, res) => {
  res.render('pages/login')
})

router.get('/registro', (req, res) => {
  res.render('pages/registro')
})

router.post('/registro', (req, res) => {
  const { nombres, apellidos, userName,
    contraseña, telefono, celular, correo } = req.body
  db.query('INSERT INTO `propietarios` (`contraseña`, `nombres`, `apellidos`,
  `telefono`, `celular`, `correo`, `userName`) VALUES (?, ?, ?, ?, ?, ?, ?)',
  [{ contraseña }, { nombres }, { apellidos }, { telefono }, { celular },
  { correo }, { userName }], (err, result) => {
    res.render('pages/registro', {

    })
  })
})

module.exports = router
