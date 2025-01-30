const express = require('express');
const { getAlbums } = require('../controllers/albumsController'); 
const router = express.Router();

router.get('/', getAlbums);

module.exports = router;
