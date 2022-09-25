# Launch School: Ruby project template

Use this template for basic Ruby projects that will run in a Docker container, which ensures consistency and portability.

## Dev Container

Projects based on this template will use Docker to quickly provide a consistent cross-platform Ruby **development** environment using the latest version of Ruby 3.

If you need a container for production use, consider the [official Docker Ruby image](https://hub.docker.com/_/ruby) as a starting point.

### Pre-requisites (Mac, Windows 10/11, Linux)

1. [Install Visual Studio Code](https://code.visualstudio.com/).
2. If Windows 10, [install and configure WSL2](https://docs.microsoft.com/en-us/windows/wsl/install-win10). If Windows 11, search for a guide to do the same.
3. If Mac, hit *Shift-Command-P*, type `Shell Command`, and select *Shell Command: Install 'code' command in PATH* option.
   1. It's also essential to drag VS Code into the Applications folder.
4. Install [Docker Desktop](https://www.docker.com/products/docker-desktop).
   - If Windows 10: enable the WSL2 integration for best performance.
5. Install the [VS Code Remote Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers).

### Build and run

1. Copy the following to a project's root folder:
   1. **.devcontainer** folder
      1. In the *devcontainer.json* file in this folder, edit the `"name"` property to something that makes sense for the project.
      - `Dockerfile` declaratively defines container build, including Ruby v3-bullseye, rvm, zsh, Gems, Pry configuration, and more.
      - `devcontainer.json` configures VS Code and coordinates Docker Compose.
      - `.vscode` folder. If you need to make persistent changes to the contents of this folder, or to anything else in this repository, be sure to fork or copy this repo and modify there for your purposes. **This folder will completely replace anything in `/workspace/src/.vscode` when the container is created or rebuilt.**
      - `.pryrc`: *pry* Gem configuration. Copied to home folder via `postCreateCommand.sh`.
      - `postCreateCommand.sh`: devcontainer.json's `postCreateCommand` executes this after the container is created.
   2. **src** folder: create or clone code repos here.
   3. **docker-compose.yml**
      - Configures:
        - Shared network
        - Ruby dev container (service)
        - PlantUML container (service)
2. Navigate to the project folder that contains the `.devcontainer` folder in your (Linux) shell, then enter `code .`. Visual Studio will prompt you to open the folder in a dev container, automatically building the image if it doesn't already exist and opening the `src` folder.
   - Clone one or more repositories to the `src` folder.
   - Your project files will automatically sync between the container and your host file system, so the container can restart without data loss.
   - Consider incorporating the container configuration into specific projects that need customized containers, in which case open those projects in a separate VS Code window that runs in its own container.

### Install and run a specific Ruby version with rvm

1. Install with a command like this: `rvm install ruby-x.x.x` (ruby-major.minor.patch)
2. Set the default Ruby version with a command like this: `rvm --default use ruby-x.x.x`
3. Revert to the system-default Ruby version (run Ruby programs without rvm): `rvm --default use system`

### Debug

This template is configured to support both pry/pry-byebug (REPL debugger) and VS Code debugging out of the box.

#### Debug with pry-byebug

It's worth knowing how to debug using the REPL-based Pry, especially Pry-ByeBug, because the VS Code debugger may not do everything you need it to do, especially with complex or remote dev environments.

[Learn more here](https://github.com/deivid-rodriguez/pry-byebug).

#### Debug with VS Code

Hit F5 to begin debugging the focused open file using the default configuration.

VS Code offers a number of advantages over REPL-based debugging, such as:

- Streamlined and source code-integrated debugging experience: hover over source code variables to view values.
- Set temporary breakpoints and start debugging with a quick F5 press; no need to modify source code with `require 'pry'` and `binding.pry` statements.
- View a list of variables and their values in a breakpoint's scope.

[Learn more here](https://code.visualstudio.com/docs/editor/debugging).

## Create your own Ruby dev container

After completing the pre-requisites above:

1. Hit F1 (Show All Commands shortcut) | Type/select: >Remote-Containers: Add Development Container Configuration Files...
2. Type *Ruby* and select it.
   - There's also Ruby on Rails and others; select *Show All Definitions...*, then search again to view.
3. Select a version.
4. Customize the dev container, including VS Code settings, to your liking.

### Learn more

- [Develop with containers (Microsoft)](https://code.visualstudio.com/learn/develop-cloud/containers)
