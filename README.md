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
