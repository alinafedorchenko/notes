FROM ruby:3.0-bullseye as base

RUN mkdir /notes

WORKDIR /notes

RUN apt-get update -qq && apt-get install -y build-essential apt-utils libpq-dev nodejs

RUN gem install bundler

COPY Gemfile* ./

RUN bundle install

COPY . /notes

COPY entrypoint.sh /usr/bin/

RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
