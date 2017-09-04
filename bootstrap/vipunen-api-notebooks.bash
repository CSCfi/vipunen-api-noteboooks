#!/bin/bash
## Script to initialize vipunen-api-notebooks

cd /home/jovyan/work
# git reflog requires a name and email if user is not in passwd
# even if you're only cloning
export GIT_COMMITTER_NAME=vipunen
export GIT_COMMITTER_EMAIL=antero.vipunen@example.org

git clone https://github.com/CSCfi/vipunen-api-noteboooks.git

