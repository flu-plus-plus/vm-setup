#!/usr/bin/env bash

# Initialize some variables
github_username=$1
github_project_name=$2
bitbucket_username=$3
bitbucket_project_name=$4
mirror_script_path=$(pwd)/$1/mirror-$2.sh
user_path=$(pwd)/$1
clone_path=$user_path/$2
mkdir -p $user_path

# Mirroring script
cat << EOF > $mirror_script_path
if [ ! -d "$clone_path" ]; then
  git clone https://github.com/$1/$2
fi
cd $clone_path
git pull && git push --mirror git@bitbucket.org:$3/$4.git
EOF
chmod +x $mirror_script_path

# crontab file
cron_line="*/5 * * * * $mirror_script_path >$user_path/mirror-log-$2 2>&1"
(crontab -l; echo "$cron_line") | crontab -
