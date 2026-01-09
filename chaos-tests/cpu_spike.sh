#!/bin/bash
# Spike CPU usage for testing auto-heal / monitoring

CPU_CORES=2
DURATION=60  # seconds

echo "Spiking CPU on $CPU_CORES cores for $DURATION seconds..."
stress --cpu $CPU_CORES --timeout $DURATION

# Log the event
echo "$(date) - CPU stress test completed" >> ~/self-healing-linux/remediation/auto_heal.log

echo "Done."
