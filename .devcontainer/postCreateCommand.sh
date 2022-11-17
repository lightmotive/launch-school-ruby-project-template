cd /workspace
rm -rf ./src/.vscode
cp -R ./.devcontainer/.vscode ./src
cp -R ./.devcontainer/.pryrc /home/vscode/

# Heroku CLI w/ auto-update
# Guide: https://devcenter.heroku.com/articles/heroku-cli
curl https://cli-assets.heroku.com/install.sh | sh
