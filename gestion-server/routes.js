'use strict'

const express = require('express')
const router = express.Router()
const db = require('gestion-db')
const passport = require('passport')

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

router.post('/registro', async (req, res) => {
  await db.query('INSERT INTO propietarios (contraseña, nombres, apellidos, telefono, celular, correo, userName) VALUES ( ?, ?, ?, ?, ?, ?, ?)',
    [req.body.contraseña, req.body.nombres, req.body.apellidos, req.body.telefono, req.body.celular, req.body.correo, req.body.userName], (err, result) => {
        res.redirect('/login')
  })
})

router.get('/Admin', (req, res) => {
  db.query('SELECT * FROM noticias ', (err, result) => {
    res.render('pages/indexAdmin', {
      data: result
    })
  })
})

router.get('/Residente', (req, res) => {
  db.query('SELECT * FROM noticias ', (err, result) => {
    res.render('pages/indexUser', {
      data: result
    })
  })
})

router.get('/Residente/Noticias', (req, res) => {
  db.query('SELECT * FROM noticias ', (err, result) => {
    res.render('pages/NoticiasResidente', {
      data: result
    })
  })
})

router.get('/Residente/Eventos', (req, res) => {
  db.query('SELECT * FROM eventos ', (err, result) => {
    res.render('pages/EventosResidente', {
      data: result
    })
  })
})

router.get('/Residente/Informes', (req, res) => {
  db.query('SELECT * FROM informes ', (err, result) => {
    res.render('pages/InformesResidente', {
      data: result
    })
  })
})

module.exports = router
