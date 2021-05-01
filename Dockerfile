# Source: https://hub.docker.com/_/ruby

FROM docker-ruby-version

ENV LANG=C.UTF-8

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install

# Install zsh
RUN ["apt-get", "update"]
RUN ["apt-get", "install", "-y", "zsh"]
RUN ["chsh", "-s", "$(which zsh)"]
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true

COPY . .

# CMD ["ruby", "./test.rb"]
# CMD ["irb"]
# CMD ["bash"]
CMD ["zsh"]
