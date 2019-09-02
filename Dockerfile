FROM ruby:2.6.2

RUN apt-get update && apt-get install -y build-essential libpq-dev postgresql-client
RUN gem install rails

RUN mkdir /rails-app-name
WORKDIR /rails-app-name

COPY Gemfile /rails-app-name/Gemfile
COPY Gemfile.lock /rails-app-name/Gemfile.lock

RUN bundle install
COPY . /rails-app-name

CMD ["rails", "server", "-b", "0.0.0.0"]
