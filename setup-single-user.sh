# Initialize some variables
github_username=$1
github_project_name=$2
bitbucket_username=$3
bitbucket_project_name=$4
mirror_script_path=$(pwd)/$1/mirror-$2.sh
clone_path=$(pwd)/$1/$2
mkdir -p $clone_path

# Mirroring script
cat << EOF > $mirror_script_path
if [ ! -d "$clone_path" ]; then
  git clone https://github.com/$1/$2
fi
cd $clone_path
git pull && git push --mirror git@bitbucket.org:$3/$4.git
EOF

# crontab file
cat << EOF | crontab -
MAILTO=""
*/5 * * * * $mirror_script_path >$(pwd)/$1/mirror-log-$2 2>&1
EOF
