#!/bin/bash

docker-compose run --rm app bundle install

docker-compose run --rm app yarn install

docker-compose run --rm app bundle exec rails db:migrate

docker-compose up -d