#!/usr/bin/env bash

current_dir_path=$(dirname $0)
# Clear the crontab
bash $current_dir_path/clear-crontab.sh
# format: setup-single-user.sh github-username github-project bitbucket-username bitbucket-project
bash $current_dir_path/setup-single-user.sh flu-plus-plus bachelorproef flu-plus-plus bachelorproef
bash $current_dir_path/setup-single-user.sh jonathanvdc bachelorproef jonathanvdc bachelorproef
bash $current_dir_path/setup-single-user.sh lynn bachelorproef lynnvh bachelorproef
bash $current_dir_path/setup-single-user.sh Sibert-Aerts bachelorproef Sibert-Aerts bachelorproef
bash $current_dir_path/setup-single-user.sh cekefun bachelorproef Cekefun bachelorproef
