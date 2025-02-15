// Config stuff
import { pool } from '../config.js';

// Dependencies
import {Router} from 'express';

// * Router get posts
export const postsRouter = Router();
postsRouter.get('/', async (req, res) => {
    const {
        id
    } = req.query

    if (id) {
        const query = await pool.query(`SELECT * FROM "Posts" WHERE id=${id}`)
        const result = query.rows[0]
        res.send(result)
    }
    else {
        const query = await pool.query(`SELECT * FROM "Posts"`)
        const result = query.rows
        res.send(result)
    }
    pool.end
})