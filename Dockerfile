FROM ruby:3.2-slim

WORKDIR /app

# Install dependencies
RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev nodejs postgresql-client libyaml-dev && \
    apt-get clean

# Install gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Add Rails app code
COPY . .

# Run server
CMD ["rails", "server", "-b", "0.0.0.0"]