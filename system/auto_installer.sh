#!/bin/bash
echo "[Vo3lk3rOS Auto-Installer] Repository wird geklont..."
git clone https://github.com/Vo3lk3r/Vo3lk3rOS-.git /vo3lk3ros
cd /vo3lk3ros
git checkout b23bb62b674efb907f262a2b4965c8a1b8fe0089
bash /vo3lk3ros/system/bootstrap_v1.sh
bash /vo3lk3ros/system/install_gpts.sh
bash /vo3lk3ros/moneymaker/start_moneymaker.sh
bash /vo3lk3ros/alpha_control/alpha_watchdog.sh
