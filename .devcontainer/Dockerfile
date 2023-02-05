# [Choice] Ruby version (use -bullseye variants on local arm64/Apple Silicon): 3, 3.1, 3.0, 2, 2.7, 2.6, 3-bullseye, 3.1-bullseye, 3.0-bullseye, 2-bullseye, 2.7-bullseye, 2.6-bullseye, 3-buster, 3.1-buster, 3.0-buster, 2-buster, 2.7-buster, 2.6-buster
ARG VARIANT=3.1-bullseye
FROM mcr.microsoft.com/vscode/devcontainers/ruby:0-${VARIANT}

# [Choice] Node.js version: none, lts/*, 16, 14, 12, 10
ARG NODE_VERSION="none"
RUN if [ "${NODE_VERSION}" != "none" ]; then su vscode -c "umask 0002 && . /usr/local/share/nvm/nvm.sh && nvm install ${NODE_VERSION} 2>&1"; fi

# git config
RUN git config --system init.defaultBranch main
RUN git config --global init.defaultBranch main

# Retrieve and configure to install latest PostgreSQL client.
# - Without this, an older psql release will be installed.
RUN sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

# Install additional OS packages:
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
  && apt-get -y install --no-install-recommends tree postgresql-client

# Install additional gems:
RUN gem install rubocop
RUN gem install pry -v 0.13.0
# pry-byebug requires pry (~> 0.13.0)
RUN gem install pry-doc
RUN gem install pry-byebug
RUN gem install minitest
RUN gem install minitest-reporters
RUN gem install simplecov
RUN gem install rake
# VS Code debugging support:
# - Details: https://github.com/rubyide/vscode-ruby/blob/main/docs/debugger.md
RUN gem install ruby-debug-ide
RUN gem install debase --pre

# [Optional] Uncomment this line to install global node packages.
# RUN su vscode -c "source /usr/local/share/nvm/nvm.sh && npm install -g <your-package-here>" 2>&1
