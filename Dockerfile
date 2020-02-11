FROM ruby:2.6.5

RUN apt-get update -qq && apt-get install -yqq libgeos-dev libproj-dev

WORKDIR /app
