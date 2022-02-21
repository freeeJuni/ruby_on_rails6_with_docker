## Manual
```
juni% git clone git@github.com:freeeJuni/ruby_on_rails6_with_docker.git
juni% cd ruby_on_rails6_with_docker

juni% cat .ruby-version
ruby-2.7.0
juni% asdf local ruby 2.7.0 && asdf current
juni% cat .tool-versions
```

### making a Rails project
```
juni% docker-compose run web rails new . --force --no-deps --database=mysql
```
#### Container build
```
juni% docker-compose build

  (if error)
  gem install bundler:1.17.2
  bundle config --local build.mysql2 "--with-ldflags=-L/usr/local/opt/openssl/lib"
  bundle update --bundler
```
#### Edit database.yml  
config/database.yml
```  
default: &default
  adapter: mysql2
  encoding: utf8mb4
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: root
  password:
  host: localhost

development:
  <<: *default
  database: myapp_development
  host: db
  username: root
  password: password

test:
  <<: *default
  database: myapp_test
  host: db
  username: root
  password: password
```

#### Create the database
juni% docker-compose run web rails db:create

#### Webpacker installation
juni% docker-compose run web rails webpacker:install 

#### Starting Containers by docker-compose
juni% docker-compose up -d

#### Check your browser
inputting "localhost:3000" in your browser.

#### Container down
juni% docker-compose down  
 ``` 

### reference
https://zenn.dev/tmasuyama1114/articles/rails-docker-6x-how-to#webpacker%E3%82%92%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB
https://blog.codecamp.jp/docker-ruby-on-rails-mac
https://qiita.com/nsy_13/items/9fbc929f173984c30b5d  
