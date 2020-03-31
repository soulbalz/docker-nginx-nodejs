const fastify = require('fastify')({
  logger: true
});

fastify.get('/', (request, reply) => {
  reply.send({ hello: 'world' })
});

fastify.listen(3000, (err, address) => {
  if (err) {
    fastify.log.error(err)
    process.exit(1)
  }
  fastify.log.info(`> Server listening on ${address}`)
});
