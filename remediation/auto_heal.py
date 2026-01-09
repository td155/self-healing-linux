import subprocess
import os
from datetime import datetime

LOG_FILE = "/home/teju/self-healing-linux/remediation/auto_heal.log"

def log(msg):
    with open(LOG_FILE, "a") as f:
        f.write(f"{datetime.now()} - {msg}\n")

# ---- Check nginx service ----
nginx_status = subprocess.getoutput("systemctl is-active nginx")

if nginx_status != "active":
    os.system("systemctl restart nginx")
    log("nginx was down, restarted successfully")

# ---- Check disk usage ----
disk_usage = subprocess.getoutput("df / | tail -1 | awk '{print $5}'")
disk_usage = int(disk_usage.strip('%'))

if disk_usage > 90:
    os.system("rm -rf /tmp/*")
    log("Disk usage above 90%, cleaned /tmp")

