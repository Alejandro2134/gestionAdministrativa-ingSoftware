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

router.post('/login', (req, res) => {
  const { sesion } = req.body

  if(sesion === 'Administrador'){
    const { userAdmin, contraseñaAdmin } = req.body
    db.query('SELECT * FROM administradores WHERE ? AND ?', [{ userAdmin }, { contraseñaAdmin }], (err, result) => {
      res.render('pages/indexAdmin', {
        data: result
      })
    })
  }

  if(sesion === 'Propietario'){
    let userName = req.body.userAdmin
    let contraseña = req.body.contraseñaAdmin
    db.query('SELECT * FROM propietarios WHERE ? AND ?', [{ userName }, { contraseña }], (err, result) => {
      res.render('pages/indexUser', {
        data: result
      })
    })
  }
})

router.get('/registro', (req, res) => {
  res.render('pages/registro')
})

router.get('/admin', (req, res) => {
  res.render('pages/indexAdmin')
})

router.get('/propietario', (req, res) => {
  res.render('pages/indexUser')
})

router.post('/registro', async (req, res) => {
  await db.query('INSERT INTO propietarios (contraseña, nombres, apellidos, telefono, celular, correo, userName) VALUES ( ?, ?, ?, ?, ?, ?, ?)',
    [req.body.contraseña, req.body.nombres, req.body.apellidos, req.body.telefono, req.body.celular, req.body.correo, req.body.userName], (err, result) => {
        res.redirect('/login')
  })
})

module.exports = router
