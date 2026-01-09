#!/bin/bash
# start_monitoring.sh
# Script to start Node Exporter and Prometheus

# --- Node Exporter ---
NODE_PATH="$HOME/self-healing-linux/monitoring/node_exporter-1.7.0.linux-amd64"
echo "Starting Node Exporter..."
nohup $NODE_PATH/node_exporter --web.listen-address="0.0.0.0:9100" > ~/self-healing-linux/logs/node_exporter.log 2>&1 &

# --- Prometheus ---
PROM_PATH="$HOME/self-healing-linux/monitoring/prometheus-2.48.0.linux-amd64"
echo "Starting Prometheus..."
nohup $PROM_PATH/prometheus --config.file=$PROM_PATH/prometheus.yml --web.listen-address="0.0.0.0:9090" > ~/self-healing-linux/logs/prometheus.log 2>&1 &

echo "Monitoring services started!"
echo "Prometheus: http://localhost:9090"
echo "Node Exporter: http://localhost:9100"
