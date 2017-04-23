FROM ruby:2.3.3-slim

RUN apt-get update -qq && apt-get install -qq -y --no-install-recommends \
        build-essential git-core \
        && rm -rf /var/lib/apt/lists/*

ENV INSTALL_PATH /opt
RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY Gemfile* ./
RUN  gem install bundler && bundle check || bundle install --jobs=4 --retry=3
ENV RAILS_ENV production

COPY . ./
RUN bundle exec rake assets:precompile

EXPOSE 3000
CMD bundle exec puma -C config/puma.rb
