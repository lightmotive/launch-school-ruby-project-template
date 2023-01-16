#!/bin/bash

# Current working directory: "workspaceFolder" set in devcontainer.json

# Import `.env` variables for use below
if [ -f ../.devcontainer/.env ]; then
  export $(cat ../.devcontainer/.env | xargs)
fi

rm -rf ./.vscode
cp -R ../.devcontainer/.vscode ./
cp -R ../.devcontainer/.pryrc /home/vscode/

# Allow known repos with locally renamed directories
git config --global --add safe.directory ./ls-ls180-dbf

# Enable automatic local login using password file
touch ~/.pgpass
chmod 0600 ~/.pgpass
echo "db:5432:*:$POSTGRES_USER:$POSTGRES_PASSWORD" >>~/.pgpass
echo "** Automatic local PSQL login enabled for $POSTGRES_USER **"

# Bundler dev env config
bundle config set --local without production

# Heroku CLI w/ auto-update
# Guide: https://devcenter.heroku.com/articles/heroku-cli
curl https://cli-assets.heroku.com/install.sh | sh
