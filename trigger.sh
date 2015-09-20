#!/bin/sh

TRIGGER_URL=https://registry.hub.docker.com/u/lwieske/java-8/trigger/12345678901234567890123456789012345/

curl -H "Content-Type: application/json" --data '{"docker_tag": "jdk-8u60"}' -X POST $TRIGGER_URL

sleep 200

curl -H "Content-Type: application/json" --data '{"docker_tag": "jre-8u60"}' -X POST $TRIGGER_URL

sleep 200

curl -H "Content-Type: application/json" --data '{"docker_tag": "server-jre-8u60"}' -X POST $TRIGGER_URL

sleep 200

curl -H "Content-Type: application/json" --data '{"docker_tag": "latest"}' -X POST $TRIGGER_URL
