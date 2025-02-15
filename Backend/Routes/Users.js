// Config stuff
import { pool } from '../config.js';

// Dependencies
import {Router} from 'express';

// * Router get users
export const usersRouter = Router();
usersRouter.get('/', async (req, res) => {
    const {
        id
    } = req.query

    if (id) {
        const query = await pool.query(`SELECT * FROM "Users" WHERE id=${id}`)
        const result = query.rows[0]
        res.send(result)
    }
    else {
        const query = await pool.query(`SELECT * FROM "Users"`)
        const result = query.rows
        res.send(result)
    }
    pool.end
})