FROM ruby:2.7.1
RUN apt-get update && apt-get install -y --no-install-recommends build-essential libpq-dev nodejs \
  && rm -rf /var/lib/apt/lists/*
WORKDIR /my_app
COPY Gemfile /my_app/Gemfile
COPY Gemfile.lock /my_app/Gemfile.lock
RUN gem install bundler:2.1.4 && bundle install
COPY . /my_app
