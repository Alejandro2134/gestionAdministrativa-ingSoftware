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

router.get('/Admin', (req, res) => {
  res.render('pages/indexAdmin')
})

router.get('/Residente', (req, res) => {
  res.render('pages/indexUser')
})

router.post('/registro', async (req, res) => {
  await db.query('INSERT INTO propietarios (contraseña, nombres, apellidos, telefono, celular, correo, userName) VALUES ( ?, ?, ?, ?, ?, ?, ?)',
    [req.body.contraseña, req.body.nombres, req.body.apellidos, req.body.telefono, req.body.celular, req.body.correo, req.body.userName], (err, result) => {
        res.redirect('/login')
  })
})

module.exports = router
