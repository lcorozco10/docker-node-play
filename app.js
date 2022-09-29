const express = require('express');
const redis = require('redis');
const path = require('path');
const app = express();
const router = express.Router();
const port = 3000;

let redisClient;

(async () => {
  redisClient = redis.createClient({
    socket: {
      host: 'redis-service',
      port: 6379
    }
  });

  redisClient.on("error", (error) => console.error(`Error : ${error}`));

  await redisClient.connect();
})();

router.get('/', async function (req, res) {
  const counter = await redisClient.get('counter');
  console.log(counter);
  await redisClient.set('counter', counter ? parseInt(counter) + 1 : 1);

  res.sendFile(path.join(__dirname + '/index.html'));
});

 /* router.get('/', async function (req, res) {  
  res.sendFile(path.join(__dirname + '/index.html'));
}); */

app.use('/', router);

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});