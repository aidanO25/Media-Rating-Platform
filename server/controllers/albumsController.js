const pool = require('../db');  

const getAlbums = async (req, res) => {
    try {
        const result = await pool.query('SELECT * FROM albums'); 
        res.json(result.rows); 
    } catch (error) {
        console.error('Error fetching albums:', error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
};

module.exports = {
    getAlbums
};
