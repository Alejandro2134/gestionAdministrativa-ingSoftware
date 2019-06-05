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
      res.render('pages/indexPropietario', {
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
//------------------------------------------------------------
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
//------------------------------------------------------------
router.get('/admin/actEventos', async (req, res) => {
  await db.query('SELECT * FROM eventos ', (err, result) => {
    res.render('pages/actEventos', {
      data: result
    })
  })
})

router.get('/admin/actEventos/delete/:id', async (req, res) => {
  const { id } = req.params;
  await db.query('DELETE FROM eventos WHERE idEventos = ?', [id])
  res.redirect('/admin/actEventos')
})

router.get('/admin/actEventos/agregarEvento', (req, res) => {
  res.render('pages/agregarEvento')
})

router.post('/admin/actEventos/agregarEvento', async (req, res) => {
  const { tituloEvento, contenidoEvento } = req.body;
  await db.query('INSERT INTO eventos (nombreEvento, contenidoEvento) VALUES (?, ?)', [tituloEvento, contenidoEvento])
  res.redirect('/admin/actEventos')
})

router.get('/admin/actEventos/update/:id', async (req, res) => {
  const { id } = req.params;
  await db.query('SELECT * FROM eventos WHERE idEventos = ?', [id], (err, result) => {
    res.render('pages/updateEvento', {
      data: result
    })
  })
})

router.post('/admin/actEventos/update/:id', async (req, res) => {
  const { id } = req.params;
  await db.query('UPDATE eventos SET nombreEvento = ?, contenidoEvento = ? WHERE idEventos = ?', [req.body.tituloEvento, req.body.contenidoEvento, id]);
  res.redirect('/admin/actEventos')
})
//------------------------------------------------------------
router.get('/admin/actInformes', async (req, res) => {
  await db.query('SELECT * FROM informes ', (err, result) => {
    res.render('pages/actInformes', {
      data: result
    })
  })
})

router.get('/admin/actInformes/delete/:id', async (req, res) => {
  const { id } = req.params;
  await db.query('DELETE FROM informes WHERE idInformes = ?', [id])
  res.redirect('/admin/actInformes')
})

router.get('/admin/actInformes/agregarInforme', (req, res) => {
  res.render('pages/agregarInforme')
})

router.post('/admin/actInformes/agregarInforme', async (req, res) => {
  const { nombreInforme, ubicacionInforme, fechaPublicacion } = req.body;
  await db.query('INSERT INTO informes (nombreInforme, ubicacionInforme, fechaPublicacion) VALUES (?, ?, ?)', [nombreInforme, ubicacionInforme, fechaPublicacion])
  res.redirect('/admin/actInformes')
})

router.get('/admin/actInformes/update/:id', async (req, res) => {
  const { id } = req.params;
  await db.query('SELECT * FROM informes WHERE idInformes = ?', [id], (err, result) => {
    res.render('pages/updateInforme', {
      data: result
    })
  })
})

router.post('/admin/actInformes/update/:id', async (req, res) => {
  const { id } = req.params;
  await db.query('UPDATE informes SET nombreInforme = ?, ubicacionInforme = ?, fechaPublicacion = ? WHERE idInformes = ?', [req.body.nombreInforme, req.body.ubicacionInforme, req.body.fechaPublicacion, id]);
  res.redirect('/admin/actInformes')
})

//------------------------------------------------------------------------------------------

router.get('/admin/actPropietarios', async (req, res) => {
  await db.query('SELECT * FROM propietarios ', (err, result) => {
    res.render('pages/actPropietarios', {
      data: result
    })
  })
})

router.get('/admin/actPropietarios/delete/:id', async (req, res) => {
  const { id } = req.params;
  await db.query('DELETE FROM propietarios WHERE idPropietarios = ?', [id])
  res.redirect('/admin/actPropietarios')
})

router.get('/admin/actPropietarios/update/:id', async (req, res) => {
  const { id } = req.params;
  await db.query('SELECT * FROM propietarios WHERE idPropietarios = ?', [id], (err, result) => {
    res.render('pages/updatePropietario', {
      data: result
    })
  })
})

router.post('/admin/actPropietarios/update/:id', async (req, res) => {
  const { id } = req.params;
  await db.query('UPDATE propietarios SET nombres = ?, apellidos = ?, telefono = ?, celular = ?, correo = ?, userName = ? WHERE idPropietarios = ?', [req.body.nombres, req.body.apellidos, req.body.telefono, req.body.celular, req.body.correo, req.body.userName, id]);
  res.redirect('/admin/actPropietarios')
})

//----------------------------------------------------------------------------------------------

router.get('/admin/actEmpresaAseo',async (req, res) => {
  await db.query('SELECT * FROM empresaaseo ', (err, result) => {
    res.render('pages/actEmpresaAseo', {
      data: result
    })
  })
})

router.get('/admin/actEmpresaAseo/agregarEmpresaAse', (req, res) => {
  res.render('pages/agregarEmpresaAse')
})

router.post('/admin/actEmpresaAseo/agregarEmpresaAse', async (req, res) => {
  const { nombreAseo, direccionAseo, telefonoAseo, celularAseo } = req.body;
  await db.query('INSERT INTO empresaaseo (nombreAseo, direccionAseo, telefonoAseo, celularAseo ) VALUES (?, ?, ?, ?)', [nombreAseo, direccionAseo, telefonoAseo, celularAseo])
  res.redirect('/admin/actEmpresaAseo')
})

router.get('/admin/actEmpresaAseo/delete/:id', async (req, res) => {
  const { id } = req.params;
  await db.query('DELETE FROM empresaaseo WHERE idEmpresaAseo = ?', [id])
  res.redirect('/admin/actEmpresaAseo')
})

router.get('/admin/actEmpresaAseo/update/:id', async (req, res) => {
  const { id } = req.params;
  await db.query('SELECT * FROM empresaaseo WHERE idEmpresaAseo = ?', [id], (err, result) => {
    res.render('pages/updateEmpresaAseo', {
      data: result
    })
  })
})

router.post('/admin/actEmpresaAseo/update/:id', async (req, res) => {
  const { id } = req.params;
  await db.query('UPDATE empresaaseo SET nombreAseo = ?, direccionAseo = ?, telefonoAseo = ?, celularAseo = ? WHERE idEmpresaAseo = ?', [req.body.nombreAseo, req.body.direccionAseo, req.body.telefonoAseo,req.body.celularAseo, id]);
  res.redirect('/admin/actEmpresaAseo')
})

//-------------------------------------------------------------------------------------------------

router.get('/admin/actEmpresaVig', (req, res) => {
   db.query('SELECT * FROM empresavigilancia ', (err, result) => {
    res.render('pages/actEmpresaVig', {
      data: result
    })
  })
})

router.get('/admin/actEmpresaVig/agregarEmpresaVig', (req, res) => {
  res.render('pages/agregarEmpresaVig')
})

router.post('/admin/actEmpresaVig/agregarEmpresaVig', async (req, res) => {
  const { nombreEmpresa, direccionEmpresa, telefonoEmpresa, celularEmpresa} = req.body;
  await db.query('INSERT INTO empresavigilancia (nombreVig, direccionVig, telefonoVig, celularVig ) VALUES (?, ?, ?, ?)', [nombreEmpresa, direccionEmpresa, telefonoEmpresa, celularEmpresa])
  res.redirect('/admin/actEmpresaVig')
})

router.get('/admin/actEmpresaVig/delete/:id', async (req, res) => {
  const { id } = req.params;
  await db.query('DELETE FROM empresavigilancia WHERE idEmpresaVigilancia = ?', [id])
  res.redirect('/admin/actEmpresaVig')
})

router.get('/admin/actEmpresaVig/update/:id', async (req, res) => {
  const { id } = req.params;
  await db.query('SELECT * FROM empresavigilancia WHERE idEmpresaVigilancia = ?', [id], (err, result) => {
    res.render('pages/updateEmpresaVig', {
      data: result
    })
  })
})

router.post('/admin/actEmpresaVig/update/:id', async (req, res) => {
  const { id } = req.params;
  await db.query('UPDATE empresavigilancia SET nombreVig = ?, direccionVig = ?, telefonoVig = ?, celularVig = ? WHERE idEmpresaVigilancia = ?', [req.body.nombreEmpresa, req.body.direccionEmpresa, req.body.telefonoEmpresa,req.body.celularEmpresa, id]);
  res.redirect('/admin/actEmpresaVig')
})

//----------------------------------------------------------------------------------

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
