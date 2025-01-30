const fetch = require('node-fetch');

const options = {
  method: 'GET',
  headers: {
    accept: 'application/json',
    Authorization: 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2NWFkOGE0Y2NiNDgyNWNhOGMxNGYyNzIxYjNkYTA1MiIsIm5iZiI6MTcyOTYzMzA4NS45NTY3NTEsInN1YiI6IjY1Y2U3NmY5MWM2YWE3MDFhYTkxNzk3NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.frQynqEqWI9w7Tt0nGLqyh7geVkOcuXh_qzNQyGdF1E'
  }
};

const getPopularMovies = async (req, res) => {
  try {
    const response = await fetch('https://api.themoviedb.org/3/movie/popular', options);
    const data = await response.json();
    res.status(200).json(data);
  } catch (error) {
    console.error(error);
    res.status(500).send('Failed to fetch popular movies');
  }
};

module.exports = { getPopularMovies };