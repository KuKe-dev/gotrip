// Dependencies
import dotenv from 'dotenv'
import pg from 'pg'

// PG pool connection
dotenv.config()
export const pool = new pg.Pool({
    database: process.env.PG_DATABASE,
    port: process.env.PG_PORT,
    user: process.env.PG_USER,
    password: process.env.PG_PASSWORD
})

export const PORT = process.env.PORT ?? 1234 // Port config

// Cors config
import cors from 'cors'
export const corsConfig = cors({
    origin: '*'
})