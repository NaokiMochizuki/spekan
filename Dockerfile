FROM ruby:3.1.2
ENV TZ Asia/Tokyo

RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get update -qq \
    && apt-get install -y nodejs \
    && npm install -g yarn \
    && apt-get install -y vim

WORKDIR /app
RUN gem install bundler
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install

COPY . .

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
CMD bundle exec rails s -p 3000 -b '0.0.0.0'


