# ruby_on_rails6_with_docker
```
git clone git@github.com:freeeJuni/ruby_on_rails6_with_docker.git
cd ruby_on_rails6_with_docker
asdf local nodejs 12.13.0 && asdf local ruby 2.6.3 && asdf local packer 1.6.1 && asdf current
```

Rails 프로젝트 만들기
```
$ docker-compose run web rails new . --force --no-deps --database=mysql
```
컨테이너 빌드
```
$ docker-compose build
```

reference
<p>
https://zenn.dev/tmasuyama1114/articles/rails-docker-6x-how-to#webpacker%E3%82%92%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB
https://blog.codecamp.jp/docker-ruby-on-rails-mac
  
https://qiita.com/nsy_13/items/9fbc929f173984c30b5d  

manual
```
  docker-compose run web rails new . --force --no-deps --database=mysql
  
  docker-compose build
  
  (if error)
  gem install bundler:1.17.2
  bundle config --local build.mysql2 "--with-ldflags=-L/usr/local/opt/openssl/lib"
  bundle update --bundler
  

```  
  
  
```  
データベースファイルの修正
上記実行後、config/database.yml ファイルを下記の通りにまるっと修正します。

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

データベースを作成
$ docker-compose run web rails db:create

Webpackerをインストール
Rails 6系から Webpacker が必要となっているため、webサーバのコンテナにwebpackerをインストールします。

$ docker-compose run web rails webpacker:install 

docker-compose でコンテナを起動
$ docker-compose up -d

アクセスして起動を確認
ブラウザから localhost:3000 にアクセスし、Rails の初期画面が表示されることを確認しましょう。
  
$ docker-compose down  
 ``` 
