FROM ruby:2.6.5-alpine3.11

ENV LANG="C.UTF-8"

ENV LANG="C.UTF-8" \
    PACKAGES="bash curl-dev build-base alpine-sdk tzdata sqlite-dev less ruby-dev nodejs"

RUN apk update && \
    apk add --no-cache --update $PACKAGES

WORKDIR /var/www

COPY ./Gemfile ./Gemfile
COPY ./Gemfile.lock ./Gemfile.lock

RUN gem install bundler && \
    bundle install --without production -j4

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3000"]