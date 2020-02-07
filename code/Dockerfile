FROM node:12.15.0-alpine3.11 as node
FROM ruby:2.7.0-alpine3.11

ENV LANG="C.UTF-8" \
    BUILD_PACKAGES="curl-dev build-base" \
    DEV_PACKAGES="zlib-dev libxml2-dev libxslt-dev tzdata yaml-dev mariadb-dev less" \
    RUBY_PACKAGES="ruby-json yaml"

COPY --from=node /opt/yarn-* /opt/yarn
COPY --from=node /usr/local/bin/node /usr/local/bin/

RUN ln -s /opt/yarn/bin/yarn /usr/local/bin/yarn \
    && ln -s /opt/yarn/bin/yarnpkg /usr/local/bin/yarnpkg

RUN apk update && \
    apk upgrade && \
    apk add --no-cache --update\
    $BUILD_PACKAGES \
    $DEV_PACKAGES \
    $RUBY_PACKAGES && \
    gem install bundler

WORKDIR /var/www

COPY ./ ./

RUN bundle install -j4

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3000"]