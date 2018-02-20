#!/bin/bash
## Script to install jupyter_dashboard and
## checkout Vipunen API repo

cd /home/jovyan/work
# git reflog requires a name and email if user is not in passwd
# even if you're only cloning
export GIT_COMMITTER_NAME=vipunen
export GIT_COMMITTER_EMAIL=antero.vipunen@example.org

git clone https://github.com/CSCfi/vipunen-api-noteboooks.git

pip install jupyter_dashboards
jupyter dashboards quick-setup --sys-prefix
jupyter nbextension enable jupyter_dashboards --py --sys-prefix
