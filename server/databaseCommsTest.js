import pkg from 'pg';
import axios from 'axios';
const { Pool } = pkg;

const mediaID = 299; // dont change after, must change pre-run

//Connect to the Remote Database.
const pool = new Pool({
  user: 'postgres',
  host: '10.11.29.119',
  database: 'Opinionate',
  password: 'capping2024',
  port: 5432,
});

// Refresh Spotify Token every 55 minutes
setInterval(fetchSpotifyAccessToken, 55 * 60 * 1000);

// Spotify API credentials
const CLIENT_ID = 'caff6515bb5c4394a35ad9b11ee09f31';
const CLIENT_SECRET = 'aa0145b7bc214e2fae5c02bc3ff2933b';
let spotifyAccessToken;

// Fetch Spotify Access Token
async function fetchSpotifyAccessToken() {
    const response = await fetch('https://accounts.spotify.com/api/token', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
            Authorization: 'Basic ' + btoa(CLIENT_ID + ':' + CLIENT_SECRET),
        },
        body: 'grant_type=client_credentials'
    });

    const data = await response.json();
    spotifyAccessToken = data.access_token;
}

// Function to fetch specific album data, including track names
const fetchMusicData = async (albumId) => {
  try {
    if (!spotifyAccessToken) await fetchSpotifyAccessToken();

    // Fetch album info
    const albumResponse = await fetch(`https://api.spotify.com/v1/albums/${albumId}`, {
      headers: {
        Authorization: `Bearer ${spotifyAccessToken}`,
      },
    });

    if (!albumResponse.ok) {
      throw new Error(`Failed to fetch album data: ${albumResponse.statusText}`);
    }

    const album = await albumResponse.json();

    // Check if album and tracks are available
    if (!album || !album.tracks || !album.tracks.items) {
      throw new Error("Album or tracks data is missing in the API response");
    }

    // Prepare album data with track names as a comma-separated string
    const albumData = {
      spotify_id: album.id,
      title: album.name,
      releaseDate: album.release_date,
      coverUrl: album.images?.[0]?.url || null,
      artist: album.artists[0]?.name || null,
      tracks: album.tracks.items.map(track => track.name), // Track names in a single string
    };

    return albumData;
  } catch (error) {
    console.error('Failed to fetch album data:', error);
  }
};

// Function to insert album data into the database
const insertMusicData = async (album) => {
  const client = await pool.connect();
  try {
    await client.query('BEGIN');
    const mediaResult = await client.query(
      `INSERT INTO media ("mediaId", title, "releaseDate", description)
       VALUES ($1, $2, $3, $4) RETURNING "mediaId"`,
      [mediaID, album.title, album.releaseDate, album.description || null]
    );

    await client.query(
      `INSERT INTO albums ("mediaID", artist, cover_url, tracks)
       VALUES ($1, $2, $3, $4)`,
      [mediaID, album.artist, album.coverUrl, album.tracks]
      
    );
      //mediaID++
    await client.query('COMMIT');
    console.log(`Album "${album.title}" inserted successfully`);
  } catch (error) {
    await client.query('ROLLBACK');
    console.error('Error inserting album data:', error);
  } finally {
    client.release();
  }
};

// Fetch and store a specific album
const fetchAndSaveAlbum = async (albumId) => {
  const album = await fetchMusicData(albumId);
  if (album) {
    await insertMusicData(album);
  }
};

fetchAndSaveAlbum('5iBvQWRRazoyt7CrEPFBsW');

// Function to fetch movie data from the TMDB API
const fetchMovieData = async (movieId) => {
  try {
    const response = await axios.get(`https://api.themoviedb.org/3/movie/${movieId}`, {
      headers: {
        accept: 'application/json',
        Authorization: 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2NWFkOGE0Y2NiNDgyNWNhOGMxNGYyNzIxYjNkYTA1MiIsIm5iZiI6MTcyOTYzMzA4NS45NTY3NTEsInN1YiI6IjY1Y2U3NmY5MWM2YWE3MDFhYTkxNzk3NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.frQynqEqWI9w7Tt0nGLqyh7geVkOcuXh_qzNQyGdF1E',
      },
      params: {
        language: 'en-US',
        append_to_response: 'credits',
      },
    });
    const movie = response.data;
    
    const baseImageUrl = 'https://image.tmdb.org/t/p/w500';
    const posterUrl = movie.poster_path ? `${baseImageUrl}${movie.poster_path}` : null;
    // Initialize an array for directors
    const directors = [];
    // Check if credits exist and access crew info.
    if (movie.credits && movie.credits.crew) {
      // Populate the directors array by checking the crew info.
      for (const credit of movie.credits.crew) {
        if (credit.job.toLowerCase() === 'director') {
          directors.push(credit.name); // add director.
        }
      }
    } else {
      console.warn('No credits found in movie data');
    }
    const cast = movie.credits.cast.slice(0, 4).map(actor => actor.name);
    console.log(directors[0]);
    return {
      tmdb_id: movie.id,
      title: movie.title,
      releaseDate: movie.release_date,
      description: movie.overview,
      posterUrl,
      studio: movie.production_companies?.[0]?.name || null,
      cast,
      director: directors[0], 
    };
  } catch (error) {
    console.error('Error fetching movie data:', error);
  }
};
// Function to insert data into the database.
const insertMovieData = async (movie) => {
  const client = await pool.connect();
  try {
    await client.query('BEGIN');
    const mediaID = 103;
    const mediaResult = await client.query(
      `INSERT INTO media ("mediaId", title, "releaseDate", description)
       VALUES ($1, $2, $3, $4) RETURNING "mediaId"`,
      [mediaID, movie.title, movie.releaseDate, movie.description]
    );
    console.log(mediaID);
    await client.query(
      `INSERT INTO movies ("mediaID", studio, "cast", director, poster_url)
       VALUES ($1, $2, $3, $4, $5)`,
      [mediaID, movie.studio, movie.cast, movie.director, movie.posterUrl]
    );
    await client.query('COMMIT');
    console.log(`Movie "${movie.title}" inserted successfully`);
  } catch (error) {
    await client.query('ROLLBACK');
    console.error('Error inserting movie data:', error);
  } finally {
    client.release();
  }
};


// // Function to fetch and insert a movie DO NOT DELETE!
// (async () => {
//   const movieId = 293660; // Desired movie ID
//   const movieData = await fetchMovieData(movieId);
//   if (movieData) {
//     await insertMovieData(movieData);
//   }
// })();


const getTableNames = async () => {
    try {
      const res = await pool.query(`
        SELECT table_name 
        FROM information_schema.tables 
        WHERE table_schema = 'public'
      `);
      console.log('Tables in the database:');
      res.rows.forEach(row => {
        console.log(row.table_name);
      });
    } catch (err) {
      console.error('Error executing query', err.stack);
    }
  };

  const insertUser = async (username, password, email) => {
    try {
      const query = `
        INSERT INTO users (username, password, email)
        VALUES ($1, $2, $3)
        RETURNING *;
      `;
      
      const values = [username, password, email];  
      
      const res = await pool.query(query, values);
      
      console.log('User inserted:', res.rows[0]); 
    } catch (err) {
      console.error('Error executing query', err.stack);
    }
  };
  
  // BOOKS! ########################################################################
  
  const fetchBookDetails = async (bookId) => {
    try {
      const response = await fetch(`https://openlibrary.org/works/${bookId}.json`);
      const book = await response.json();
  
      if (book) {
        // Format the book data
        const bookData = {
          title: book.title || 'Unknown Title',
          author: book.authors ? book.authors.map(author => author.name).join(', ') : 'Unknown',
          coverUrl: book.covers ? `https://covers.openlibrary.org/b/id/${book.covers[0]}-L.jpg` : 'https://via.placeholder.com/150',
          releaseDate: book.first_publish_date || 'N/A',
          description: book.description ? (typeof book.description === 'string' ? book.description : book.description.value) : 'No description available.'
        };
  
        return bookData;
      } else {
        throw new Error('Book not found');
      }
    } catch (error) {
      console.error('Failed to fetch book details:', error);
    }
  };
  
  // Function to insert book data into the database
  const insertBookData = async (book) => {
    const client = await pool.connect();
    try {
      await client.query('BEGIN');
      const mediaID = 350
      // Insert into the media table to get a mediaId
      const mediaResult = await client.query(
        `INSERT INTO media ("mediaId", title, description)
         VALUES ($1, $2, $3) RETURNING "mediaId"`,
        [mediaID, book.title, book.description || null]
      );
  
      
  
      // Insert into the books table using the new mediaId
      await client.query(
        `INSERT INTO books ("mediaID", author, cover_url, year)
         VALUES ($1, $2, $3, $4)`,
        [mediaID, book.author, book.coverUrl, book.releaseDate]
      );
  
      await client.query('COMMIT');
      console.log(`Book "${book.title}" inserted successfully`);
    } catch (error) {
      await client.query('ROLLBACK');
      console.error('Error inserting book data:', error);
    } finally {
      client.release();
    }
  };
  /* GET BOOKS DO NOT DELETE
  // Make sure to use a valid Open Library book ID
  (async () => {
    const bookId = 'OL15414803W'; // Use a valid Open Library book ID
    const book = await fetchBookDetails(bookId);
    if (book) {
      await insertBookData(book);
    }
  })();
  */
 

  import fs from 'fs';
  const uploadProfilePicture = async (userID, imagePath) => {
    try {
      // Read the image file as binary data
      const imageData = fs.readFileSync(imagePath);
  
      // Update the profile picture in the database
      const query = `
        UPDATE users
        SET "profilePicture" = $1
        WHERE "userID" = $2;
      `;
      await pool.query(query, [imageData, userID]);
  
      console.log('Profile picture uploaded successfully for user ID:', userID);
    } catch (err) {
      console.error('Error executing query:', err.stack);
    }
  };
  
  // Example usage
  uploadProfilePicture(41, 'Marist-Capping/client/pages/images/logo1.png');

 

  

