# 🛠️ Self-Healing Linux System

## 📌 Overview
Self-Healing Linux is a lightweight resilience engineering project that demonstrates how a Linux system can **detect resource failures, inject chaos, and automatically recover** without manual intervention.

The project combines **monitoring, alerting, chaos engineering, and remediation** to simulate real-world production issues such as CPU spikes, memory exhaustion, and disk pressure, and then heals the system automatically using scripted logic.

This project is ideal for learning **DevOps, SRE, Linux internals, and chaos engineering fundamentals**.

---

## 🎯 Key Features
- Real-time system monitoring using Prometheus and Node Exporter
- Visual dashboards using Grafana
- Chaos engineering scripts to simulate failures
- Automated self-healing using Python
- Alert-driven remediation workflow
- Minimal dependencies, runs on a single Linux VM

---

## 🧩 Architecture Flow
1. Node Exporter exposes system metrics
2. Prometheus scrapes metrics and evaluates alert rules
3. Alerts trigger the auto-healing logic
4. Python remediation scripts take corrective actions
5. Grafana visualizes metrics and recovery in real time

---

## 🔍 Monitoring

- Node Exporter collects CPU, memory, disk, and filesystem metrics
- Prometheus scrapes metrics and applies alert rules
- Grafana displays real-time and historical system health

### Access Points
- Node Exporter Metrics: http://192.168.68.130:9100/metrics
- Prometheus UI: http://192.168.68.130:9090
- Grafana UI: http://<node-ip>:3000

### Grafana Dashboard
- Dashboard ID: **1860** (Node Exporter Full)
- Data Source: **Prometheus**

---

## ⚠️ Chaos Engineering

Chaos scripts intentionally stress system resources to validate resilience.

### Chaos Scripts
- `cpu_spike.sh` – Simulates high CPU usage
- `memory_full.sh` – Consumes system memory temporarily
- `disk_fill.sh` – Fills disk space safely for testing

These scripts **create controlled failures**, not permanent damage.

---

## 🔁 Self-Healing Logic

The healing mechanism is implemented in Python and works as follows:

- Monitors system health metrics
- Detects threshold violations (CPU, memory, disk)
- Automatically terminates offending processes
- Clears memory caches or disk space when required
- Logs all remediation actions for audit and debugging

File:
- `remediation/auto_heal.py`

---

## 🚨 Alert Rules

Alert rules are defined in YAML and evaluated by Prometheus.

Examples:
- High CPU usage for more than 1 minute
- Available memory below safe threshold
- Disk usage above critical percentage

File:
- `remediation/rules.yaml`

---


## ▶️ How to Run

1. Start monitoring stack:
```
./start_monitoring.sh

```


2. Run a chaos test:
```
./chaos-tests/cpu_spike.sh

```


3. Observe:
- Metrics spike in Grafana
- Alert firing in Prometheus
- Auto-healing action in logs
- Metrics return to normal automatically

---

## 🧠 Why This Is “Self-Healing”

The chaos scripts **only create failure**.  
The **healing happens automatically** through monitoring, alerting, and remediation logic.

This mimics real production systems where:
- Failures are inevitable
- Detection must be automatic
- Recovery must be fast and reliable

---

## 🚀 Future Enhancements
- Email / Slack alert notifications
- Kubernetes version
- Systemd service for auto-heal daemon
- AI-driven remediation decisions

---

## 📜 License
This project is for educational and learning purposes.


