const express = require('express');
const { getPopularMovies } = require('../controllers/moviesController');
const router = express.Router();

router.get('/popular', getPopularMovies);

module.exports = router;