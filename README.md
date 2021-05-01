# Launch School: Ruby project template

Use this template for basic Ruby projects that will run in a Docker container, which ensures consistency and portability.

## Dev Container
Projects based on this template will use Docker to quickly provide a consistent cross-platform Ruby environment. It's based on the [official Docker Ruby image](https://hub.docker.com/_/ruby).

### Initialize Ruby project
Copy the Gemfile in this template to the project or  run this command in the project directory to generate a default using Bundler:

`docker run --rm -v "$PWD":/usr/src/app -w /usr/src/app ruby:3.0.1 bundle init`

## Template placeholders:
**Copy contents below into project README.**

After copying, replace these placeholders in all copied template files:
- docker-ruby-version: e.g., *ruby:3.0.1* ([version options](https://hub.docker.com/_/ruby#:~:text=supported%20tags%20and%20respective%20dockerfile%20links))
  - Don't forget to update this in the Dockerfile!
- docker-project-name: e.g., *ls-project-name*

## Prepare project for containerization
Run this command to generate a Gemfile.lock (if not already present or after adding to Gemfile)

`docker run --rm -v "$PWD":/usr/src/app -w /usr/src/app docker-ruby-version bundle install`

## Build container
Run this once on each system to build the image:

`docker build -t docker-project-name .`

## Container commands

### Main commands: run or start

#### run
This command runs the container with file sync (bind mount):

- `docker run -it --name ls-temp -v "$PWD":/usr/src/app -w /usr/src/app docker-project-name`
  - `-it` runs the container in interactive TTY mode (so you can ).
  - Remove `-v ...` argument to run without file sync.
  - The container will stop and return control to the local shell after running the specified command. The Dockerfile specifies `zsh` as the default command.
  - Data is retained when the container stops, but not when it is removed.
    - If you want Docker to remove the container on exit, add the `--rm` option.

#### start
This command starts the stopped container (with retained config and data):

`docker start -i ls-temp`

### Example commands

- Enter Ruby REPL: *[main command]* irb
- Run a specific Ruby file: *[main command]* ruby ./path/to/file.rb
- Run Bash: *[main command]* bash
