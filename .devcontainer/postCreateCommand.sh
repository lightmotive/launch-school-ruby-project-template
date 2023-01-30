#!/bin/bash

# Current working directory: "workspaceFolder" set in devcontainer.json
DEVCONTAINER_CONFIG_PATH="$(readlink -e ../.devcontainer)"

# Import `.env` variables for use below
if [ -f $DEVCONTAINER_CONFIG_PATH/.env ]; then
  export $(cat $DEVCONTAINER_CONFIG_PATH/.env | xargs)
fi

rm -rf ./.vscode
cp -R $DEVCONTAINER_CONFIG_PATH/.vscode ./
cp -R $DEVCONTAINER_CONFIG_PATH/.pryrc /home/vscode/

# ** PostgreSQL params **
POSTGRES_HOST=db
POSTGRES_PORT=5432
POSTGRES_PGPASS_DB_LIST=*

# ** Configure Bash and Zsh profiles **
CLI_EDITOR_COMMAND="code -w"
DEVCONTAINER_COMMANDS_FILENAME=.devcontainer_commands.sh
cp $DEVCONTAINER_CONFIG_PATH/$DEVCONTAINER_COMMANDS_FILENAME ~
EXPORT_PGCMD_CONN_ARGS="export PGCMD_CONN_ARGS=( -h $POSTGRES_HOST -p $POSTGRES_PORT -U $POSTGRES_USER )"
SOURCE_MY_COMMANDS="source ~/$DEVCONTAINER_COMMANDS_FILENAME"

cat <<EOF | cat >>~/.bashrc
# Default CLI editor: VS Code
export EDITOR="$CLI_EDITOR_COMMAND"

# Add custom commands
$EXPORT_PGCMD_CONN_ARGS
$SOURCE_MY_COMMANDS
EOF

cat <<EOF | cat >>~/.zshrc
# Default CLI editor: VS Code
export VISUAL="$CLI_EDITOR_COMMAND"

# Add custom commands
$EXPORT_PGCMD_CONN_ARGS
$SOURCE_MY_COMMANDS
EOF

# Enable automatic local login using password file
touch ~/.pgpass
chmod 0600 ~/.pgpass
echo "$POSTGRES_HOST:$POSTGRES_PORT:$POSTGRES_PGPASS_DB_LIST:$POSTGRES_USER:$POSTGRES_PASSWORD" >>~/.pgpass
echo "** Automatic local PSQL login enabled for $POSTGRES_USER. Use $(dpsql) command to connect. **"

# Bundler dev env config
bundle config set --local without production

# Heroku CLI w/ auto-update
# Guide: https://devcenter.heroku.com/articles/heroku-cli
curl https://cli-assets.heroku.com/install.sh | sh

# Execute custom commands, if any
if [ -f $DEVCONTAINER_CONFIG_PATH/postCreateCommandCustom.sh ]; then
  echo "Executing custom commands..."
  chmod 0600 $DEVCONTAINER_CONFIG_PATH/postCreateCommandCustom.sh
  bash $DEVCONTAINER_CONFIG_PATH/postCreateCommandCustom.sh
fi
