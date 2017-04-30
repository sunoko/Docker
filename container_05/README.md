# Ruby on Rails on Docker

* Host OS
```
$ sw_vers && docker -v && docker-compose -v
ProductName:	Mac OS X
ProductVersion:	10.12.4
BuildVersion:	16E195
Docker version 17.03.1-ce, build c6d412e
docker-compose version 1.11.2, build dfed245
```

* Deployment instructions
```
# Railsプロジェクト作成, イメージ作成
docker-compose run --rm app rails new . --force --database=postgresql --skip-bundle

# Gemfile.lock更新
docker-compose run --rm app bundle install

# Gemfileの更新結果をイメージに反映
docker-compose build

# DB設定
# config/docker-compose.yml更新

# DB作成
docker-compose run --rm app rails db:create

# 起動
docker-compose up

docker-compose run --rm app rails g controller messages index
docker-compose run --rm app rails g model Message name:string body:string
docker-compose run --rm app rails db:migrate
```