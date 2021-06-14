# Launch School: Ruby project template

Use this template for basic Ruby projects that will run in a Docker container, which ensures consistency and portability.

## Dev Container
Projects based on this template will use Docker to quickly provide a consistent cross-platform Ruby **development** environment using the latest version of Ruby 3.

If you need a container for production use, consider the [official Docker Ruby image](https://hub.docker.com/_/ruby) as a starting point.

### Pre-requisites (Mac, Windows 10, Linux)
1. [Install Visual Studio Code](https://code.visualstudio.com/).
2. If Windows 10, [install and configure WSL2](https://docs.microsoft.com/en-us/windows/wsl/install-win10).
3. Install [Docker Desktop](https://www.docker.com/products/docker-desktop).
   - If Windows 10: enable the WSL2 integration for best performance.
4. Install the [VS Code Remote Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers).

### Build and run
1. Copy the **devcontainer** directory to a project folder and rename devcontainer to **.devcontainer** so VS Code can detect it automatically.
   - The container includes Ruby v3-latest with rvm, basic Gems, and VS Code extensions.
2. Navigate to the directory that contains the .devcontainer folder in your (Linux) shell, then enter `code .`. Visual Studio will prompt you to open the folder in the dev container, automatically building the image if it doesn't already exist.
   - Your project files will automatically sync between the container and your host file system.

### Install and run a specific Ruby version with rvm
1. Install with a command like this: `rvm install ruby-x.x.x` (ruby-major.minor.patch)
2. Set the default Ruby version with a command like this: `rvm --default use ruby-x.x.x`
3. Revert to the system-default Ruby version (run Ruby programs without rvm): `rvm --default use system`

## Start from 'scratch'
After completing the pre-requisites above:
1. Hit F1 (Show All Commands shortcut) | Type/select: >Remote-Containers: Add Development Container Configuration Files...
2. Type *Ruby* and select it.
   - There's also Ruby on Rails and others; select *Show All Definitions...*, then search again to view.
3. Select a version.
4. Customize the dev container, including VS Code settings, to your liking.

### Learn more
- [Develop with containers (Microsoft)](https://code.visualstudio.com/learn/develop-cloud/containers)