# ruby_on_rails6_with_docker
```
git clone git@github.com:freeeJuni/ruby_on_rails6_with_docker.git

asdf local nodejs 14.18.2
asdf local ruby 2.7.0
asdf local packer 1.6.1
```

Rails 프로젝트 만들기
```
$ docker-compose run web rails new . --force --no-deps --database=mysql
```
컨테이너 빌드
```
$ docker-compose build
```


