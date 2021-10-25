FROM ruby:3.0.0
# Copy application code
COPY . /application
# Change to the application's directory
WORKDIR /application
# Install gems
RUN bundle config set --local deployment 'true'
RUN bundle config set without 'development test'
RUN bundle install
# Set Rails environment to production
ENV RAILS_ENV production
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt install -y nodejs
# Start the application server
ENTRYPOINT ./entrypoint.sh