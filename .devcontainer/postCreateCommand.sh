# Current working directory: "workspaceFolder" set in devcontainer.json
rm -rf ./.vscode
cp -R ../.devcontainer/.vscode ./
cp -R ../.devcontainer/.pryrc /home/vscode/

# Bundler dev env config
bundle config set --local without production

# Heroku CLI w/ auto-update
# Guide: https://devcenter.heroku.com/articles/heroku-cli
curl https://cli-assets.heroku.com/install.sh | sh
