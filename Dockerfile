FROM ruby:2.6.3

## nodejsとyarnはwebpackをインストールする際に必要
# yarnパッケージ管理ツールをインストール
RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
apt-get update
#apt-get update && apt-get install -y yarn

###
# nodejs install
ENV NODE_VERSION=12.1.0
RUN apt install -y curl
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
ENV NVM_DIR=/root/.nvm
RUN . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION}
ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"
RUN node --version
RUN npm --version
RUN npm install --global yarn
###

#RUN apt-get update -qq && apt-get install -y yarn nodejs
RUN apt-get update -qq
RUN mkdir -p /Users/lee-uijun/Development/Docker/ruby_on_rails6/myapp
WORKDIR /Users/lee-uijun/Development/Docker/ruby_on_rails6/myapp
COPY Gemfile /Users/lee-uijun/Development/Docker/ruby_on_rails6/myapp/Gemfile
COPY Gemfile.lock /Users/lee-uijun/Development/Docker/ruby_on_rails6/myapp/Gemfile.lock
RUN bundle update --bundler
RUN bundle install
COPY . /Users/lee-uijun/Development/Docker/ruby_on_rails6/myapp

RUN yarn install --check-files
RUN yarn add webpacker
RUN bundle exec rails webpacker:compile

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
