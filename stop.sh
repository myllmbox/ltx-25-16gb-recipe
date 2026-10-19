#!/usr/bin/env bash
# Stop and remove the server container. Weights and caches stay — ./run.sh brings it back fast.
set -euo pipefail
docker exec ltx-25-16gb chown -R "$(id -u):$(id -g)" /cache >/dev/null 2>&1 || true
# SIGTERM first: the server releases the GPU cleanly; -t 30 = then SIGKILL
docker stop -t 30 ltx-25-16gb >/dev/null 2>&1 || true
docker rm -f ltx-25-16gb >/dev/null 2>&1 && echo "✓ stopped" || echo "· not running"
