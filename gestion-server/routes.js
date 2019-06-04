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

router.get('/admin', async (req, res) => {
  await db.query('SELECT * FROM noticias ', (err, result) => {
    res.render('pages/indexAdmin', {
      data: result
    })
  })
})

router.get('/admin/actNoticias', async (req, res) => {
  await db.query('SELECT * FROM noticias ', (err, result) => {
    res.render('pages/actNoticias', {
      data: result
    })
  })
})

router.get('/admin/actNoticias/delete/:id', async (req, res) => {
  const { id } = req.params;
  await db.query('DELETE FROM noticias WHERE idNoticias = ?', [id])
  res.redirect('/admin/actNoticias')
})

router.get('/admin/actNoticias/agregarNoticia', (req, res) => {
  res.render('pages/agregarNoticia')
})

router.post('/admin/actNoticias/agregarNoticia', async (req, res) => {
  const { tituloNoticia, contenioNoticia } = req.body;
  await db.query('INSERT INTO noticias (tituloNoticia, contenioNoticia) VALUES (?, ?)', [tituloNoticia, contenioNoticia])
  res.redirect('/admin/actNoticias')
})

router.get('/admin/actNoticias/update/:id', async (req, res) => {
  const { id } = req.params;
  await db.query('SELECT * FROM noticias WHERE idNoticias = ?', [id], (err, result) => {
    res.render('pages/updateNoticia', {
      data: result
    })
  })
})

router.post('/admin/actNoticias/update/:id', async (req, res) => {
  const { id } = req.params;
  await db.query('UPDATE noticias SET tituloNoticia = ?, contenioNoticia = ? WHERE idNoticias = ?', [req.body.tituloNoticia, req.body.contenioNoticia, id]);
  res.redirect('/admin/actNoticias')
})

router.get('/admin/actEventos', (req, res) => {
  res.render('pages/actEventos')
})

router.get('/admin/actInformes', (req, res) => {
  res.render('pages/actInformes')
})

router.get('/admin/actPropietarios', (req, res) => {
  res.render('pages/actPropietarios')
})

router.get('/admin/actEmpresaAseo', (req, res) => {
  res.render('pages/actEmpresaAseo')
})

router.get('/admin/actEmpresaVig', (req, res) => {
  res.render('pages/actEmpresaVig')
})

router.get('/propietario', async (req, res) => {
  await db.query('SELECT * FROM noticias ', (err, result) => {
    res.render('pages/indexPropietario', {
      data: result
    })
  })
})

router.get('/propietario/noticias', async (req, res) => {
  await db.query('SELECT * FROM noticias ', (err, result) => {
    res.render('pages/noticiasPropietario', {
      data: result
    })
  })
})

router.get('/propietario/eventos', async (req, res) => {
  await db.query('SELECT * FROM eventos ', (err, result) => {
    res.render('pages/eventosPropietario', {
      data: result
    })
  })
})

router.get('/propietario/informes', async (req, res) => {
  await db.query('SELECT * FROM informes ', (err, result) => {
    res.render('pages/informesPropietario', {
      data: result
    })
  })
})

module.exports = router
