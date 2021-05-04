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
1. Copy the **devcontainer** directory project folder and rename devcontainer to .devcontainer so VS Code can detect it automatically.
2. Navigate to the directory that contains the .devcontainer folder in your (Linux) shell, then enter `code .`. Visual Studio will prompt you to open the folder in the dev container, automatically building the image if it doesn't already exist.
   - Your project files will automatically sync between the container and your host file system.

### Learn more
- [Develop with containers (Microsoft)](https://code.visualstudio.com/learn/develop-cloud/containers)