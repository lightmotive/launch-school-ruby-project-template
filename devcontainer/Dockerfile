# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.166.1/containers/ruby/.devcontainer/base.Dockerfile

# [Choice] Ruby version: 3, 3.0, 2, 2.7, 2.6, 2.5
ARG VARIANT="3"
FROM mcr.microsoft.com/vscode/devcontainers/ruby:0-${VARIANT}

# [Option] Install Node.js
ARG INSTALL_NODE="true"
ARG NODE_VERSION="lts/*"
RUN if [ "${INSTALL_NODE}" = "true" ]; then su vscode -c "umask 0002 && . /usr/local/share/nvm/nvm.sh && nvm install ${NODE_VERSION} 2>&1"; fi

# Install additional OS packages.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
  && apt-get -y install --no-install-recommends tree

# Change default shell and install oh-my-zsh
RUN ["chsh", "-s", "$(which zsh)"]
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true

# Install additional gems.
RUN gem install rubocop
RUN gem install pry
RUN gem install readapt

# [Optional] Uncomment this line to install global node packages.
# RUN su vscode -c "source /usr/local/share/nvm/nvm.sh && npm install -g <your-package-here>" 2>&1