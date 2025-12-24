# Infrastructure Stack – Local / LAN

This repository contains independent Docker Compose files for running core infrastructure services locally or on a LAN.

Each service is managed individually and can be started, stopped, inspected, or removed without affecting others.

---

## Files

.env                 # real env values (not committed)
.env.sample          # template
redis.yml            # Valkey (Redis-compatible)
mongo.yml            # MongoDB
postgres.yml         # PostgreSQL
redpanda.yml         # Redpanda (Kafka-compatible, 3-node cluster)

---

## Environment

All services read configuration from `.env`.

Create it before running anything:

cp .env.sample .env

---

## General command pattern

docker compose -f <file>.yml <command>

---

## Start services

Valkey:
docker compose -f redis.yml up -d

MongoDB:
docker compose -f mongo.yml up -d

PostgreSQL:
docker compose -f postgres.yml up -d

Redpanda:
docker compose -f redpanda.yml up -d

---

## Check running containers

docker ps

Filter:
docker ps | grep valkey
docker ps | grep mongo
docker ps | grep postgres
docker ps | grep redpanda

---

## View logs

Follow logs:
docker compose -f redis.yml logs -f
docker compose -f mongo.yml logs -f
docker compose -f postgres.yml logs -f
docker compose -f redpanda.yml logs -f

Specific container:
docker logs valkey
docker logs mongo
docker logs postgres
docker logs redpanda-1
docker logs redpanda-2
docker logs redpanda-3

---

## Exec into containers

Valkey:
docker exec -it valkey sh

Mongo:
docker exec -it mongo bash

Postgres:
docker exec -it postgres bash

Redpanda:
docker exec -it redpanda-1 bash

---

## Service sanity checks

Valkey:
docker exec -it valkey valkey-cli -a $VALKEY_PASSWORD ping

MongoDB:
docker exec -it mongo mongosh -u root -p toor

PostgreSQL:
docker exec -it postgres psql -U root -d admin

Redpanda:
docker exec -it redpanda-1 rpk cluster info

---

## Stop services (keep data)

docker compose -f redis.yml stop
docker compose -f mongo.yml stop
docker compose -f postgres.yml stop
docker compose -f redpanda.yml stop

---

## Restart services

docker compose -f redis.yml restart
docker compose -f mongo.yml restart
docker compose -f postgres.yml restart
docker compose -f redpanda.yml restart

---

## Remove services (keep data)

docker compose -f redis.yml down
docker compose -f mongo.yml down
docker compose -f postgres.yml down
docker compose -f redpanda.yml down

---

## Remove services and data (destructive)

docker compose -f redis.yml down -v
docker compose -f mongo.yml down -v
docker compose -f postgres.yml down -v
docker compose -f redpanda.yml down -v

---

## Notes

- Each compose file runs independently.
- Same network name across files does not mean shared network.
- HOST_IP is for external access only.
- Use service names inside Docker.

---

## Status

This setup is modular, production-aligned, and safe to extend later with shared networks, HA, or clustering.
