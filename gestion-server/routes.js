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

router.get('/admin', (req, res) => {
  db.query('SELECT * FROM noticias ', (err, result) => {
    res.render('pages/indexAdmin', {
      data: result
    })
  })
})

router.get('/admin/actNoticas', (req, res) => {

})

router.get('/admin/actEventos', (req, res) => {

})

router.get('/admin/actInformes', (req, res) => {

})

router.get('/admin/actPropietarios', (req, res) => {

})

router.get('/admin/actEmpresaAseo', (req, res) => {

})

router.get('/admin/actEmpresaVig', (req, res) => {

})

router.get('/propietario', (req, res) => {
  db.query('SELECT * FROM noticias ', (err, result) => {
    res.render('pages/indexPropietario', {
      data: result
    })
  })
})

router.get('/propietario/noticias', (req, res) => {
  db.query('SELECT * FROM noticias ', (err, result) => {
    res.render('pages/noticiasPropietario', {
      data: result
    })
  })
})

router.get('/propietario/eventos', (req, res) => {
  db.query('SELECT * FROM eventos ', (err, result) => {
    res.render('pages/eventosPropietario', {
      data: result
    })
  })
})

router.get('/propietario/informes', (req, res) => {
  db.query('SELECT * FROM informes ', (err, result) => {
    res.render('pages/informesPropietario', {
      data: result
    })
  })
})

module.exports = router
