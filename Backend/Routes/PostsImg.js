// Dependencies
import {Router} from 'express';

// * Setting up path to img
import path from 'path';
import { dirname } from 'path';
import { fileURLToPath } from 'url';
const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

// * Router get img
export const postsImgsRouter = Router();
postsImgsRouter.get('/', async (req, res) => {
    const{img} = req.query
    
    if (img) {
        res.sendFile(path.join(__dirname, `../Assets/Img/Posts/${img}`));
    }
    else {
        res.send('<h1>No img specified</h1>')
    }
})