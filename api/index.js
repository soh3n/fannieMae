import express from 'express';
import { PrismaClient } from '@prisma/client';
import cors from 'cors';

const app = express();
const prisma = new PrismaClient();

app.use(cors());
app.use(express.json());

app.get('/', (req, res) => {
  res.send('hello from express');
});

// Starts the server and we're listening on port 8080
app.listen(8080, () => {
  console.log('Server is listening on port 8080');
});
