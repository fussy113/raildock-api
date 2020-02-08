# dev用
FROM ruby:2.6.5-alpine3.11

ENV LANG="C.UTF-8"

RUN apk update && \
    apk add --no-cache --update alpine-sdk tzdata mariadb-dev && \
    apk add --virtual build-packages --no-cache build-base

WORKDIR /var/www

COPY ./Gemfile ./Gemfile
COPY ./Gemfile.lock ./Gemfile.lock

RUN gem install bundler && \
    bundle install -j4 && \
    apk del build-packages

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3000"]