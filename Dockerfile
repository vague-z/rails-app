FROM ruby:2.7.2

# timezone
RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

ENV LANG C.UTF-8
ENV APP_ROOT /app

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev postgresql-client
# NodeJs install
RUN curl -SL https://deb.nodesource.com/setup_15.x | bash
RUN apt-get install -y nodejs
# Yarn install
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update
RUN apt-get install -y yarn
RUN yarn add node-sass

RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT

ADD Gemfile ${APP_ROOT}/Gemfile
ADD Gemfile.lock ${APP_ROOT}/Gemfile.lock
RUN bundle install

ADD . $APP_ROOT