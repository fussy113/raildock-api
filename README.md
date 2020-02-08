# README

## 環境

- Docker
- docker-compose
  - app コンテナ
    - ruby 2.7.0
    - Rails 6.0.2
    - node 12.15.0
  - db コンテナ
    - MySQL8.0
  - test-db コンテナ
    - MySQL8.0

## cloneから動作確認まで

```
git clone ${REPOSITORY_NAME} ${DIR_NAME}
cd ${DIR_NAME}

cp .env.example .env

docker-compose build
docker-compose run --rm app bundle install -j4
docker-compose run --rm app rails:db:migrate
docker-compose up -d
```

Gemを追加した場合は、下記を実行してください。
`docker-compose run --rm app bundle install`

http://localhost:3000で繋がります。

## hadolint

`docker run --rm -i hadolint/hadolint < code/Dockerfile`