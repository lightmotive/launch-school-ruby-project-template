#!/bin/bash

if [ -f ../.devcontainer/.env ]; then
  export $(cat ../.devcontainer/.env | xargs)
fi

# Current working directory: "workspaceFolder" set in devcontainer.json
rm -rf ./.vscode
cp -R ../.devcontainer/.vscode ./
cp -R ../.devcontainer/.pryrc /home/vscode/

# Enable automatic local login using password file
touch ~/.pgpass
chmod 0600 ~/.pgpass
echo "db:5432:*:$POSTGRES_USER:$POSTGRES_PASSWORD" >>~/.pgpass
echo "\n** Automatic local PSQL login enabled for $POSTGRES_USER **\n"

# Bundler dev env config
bundle config set --local without production

# Heroku CLI w/ auto-update
# Guide: https://devcenter.heroku.com/articles/heroku-cli
curl https://cli-assets.heroku.com/install.sh | sh
