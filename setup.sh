# Mirroring script
cat << EOF > /home/student/mirror.sh
cd ~
if [ ! -d "bachelorproef" ]; then
  git clone https://github.com/flu-plus-plus/bachelorproef
fi
cd ~/bachelorproef
git pull && git push --mirror git@bitbucket.org:flu-plus-plus/bachelorproef.git
EOF

# crontab file
cat << EOF | crontab -
MAILTO=""
*/5 * * * * /home/student/mirror.sh >/home/student/mirror-log 2>&1
EOF
