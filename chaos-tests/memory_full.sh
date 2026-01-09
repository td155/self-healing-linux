#!/bin/bash
set -e

echo "[CHAOS] Low memory test started"

# Detect total memory in MB
TOTAL_MEM_MB=$(free -m | awk '/^Mem:/{print $2}')

# Use ~70% of total memory
USE_MEM_MB=$((TOTAL_MEM_MB * 70 / 100))

echo "[INFO] Total Memory: ${TOTAL_MEM_MB}MB"
echo "[INFO] Stressing Memory: ${USE_MEM_MB}MB"

# Run memory stress
stress --vm 2 --vm-bytes ${USE_MEM_MB}M --timeout 180

echo "[RECOVERY] Memory stress finished"

