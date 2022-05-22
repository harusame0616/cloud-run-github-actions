import express from 'express';

interface Env {
  PORT?: number;
}

const { PORT = 3000 } = process.env as Env;

const app = express();
app.use(express.json());
app.get('/', (_, res) => {
  res.send({ message: 'hello world' });
});

app.listen(PORT, '0.0.0.0', () => {
  console.log(`listening on port ${PORT}`);
});
