ARG NODE_VERSION
ARG RUBY_VERSION

FROM node:${NODE_VERSION}-alpine as node
FROM ruby:${RUBY_VERSION}-alpine

ENV LANG C.UTF-8

COPY --from=node /opt/yarn-* /opt/yarn
COPY --from=node /usr/local/bin/node /usr/local/bin/
RUN ln -s /opt/yarn/bin/yarn /usr/local/bin/yarn \
    && ln -s /opt/yarn/bin/yarnpkg /usr/local/bin/yarnpkg


RUN gem install bundler
RUN bundle config build.nokogiri --use-system-libraries

ENV BUILD_PACKAGES="curl-dev ruby-dev build-base" \
    DEV_PACKAGES="zlib-dev libxml2-dev libxslt-dev tzdata yaml-dev sqlite-dev mariadb-dev git" \
    RUBY_PACKAGES="ruby-json yaml"

RUN apk update && \
    apk upgrade && \
    apk add --no-cache --update\
    $BUILD_PACKAGES \
    $DEV_PACKAGES \
    $RUBY_PACKAGES

RUN yarn global add npm

WORKDIR /var/www