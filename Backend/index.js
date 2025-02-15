// Config stuffs
import { PORT, corsConfig} from './config.js'

// Dependencies
import Express from 'express'

// * Routers
import {usersRouter} from './Routes/Users.js'
import { postsRouter } from './Routes/Posts.js'
import { postsImgsRouter } from './Routes/PostsImg.js'

// Setting up express
const app = Express()
app.use(corsConfig)

// * Routers config
app.use('/users', usersRouter)
app.use('/posts', postsRouter)
app.use('/imgs', postsImgsRouter)

// * Server listening
app.get("/", (req, res) => {
    res.send('<h1>Server is running</h1>')
})
app.listen(PORT, (req,res) => {
    console.log(`Server is running in http://localhost:${PORT}`)
})