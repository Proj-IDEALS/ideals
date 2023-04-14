# Dockerfile development version
FROM ruby:3.1.3 AS ideals-development

RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -\
  && apt-get update -qq && apt-get install -qq --no-install-recommends \
    nodejs \
  && apt-get upgrade -qq \
  && apt-get clean \
  && apt-get install -y libvips \
  && rm -rf /var/lib/apt/lists/*\
  && npm install -g yarn@1

# Default directory
ENV INSTALL_PATH /opt/app
ENV RAILS_ENV production

RUN mkdir -p $INSTALL_PATH

# Install gems
WORKDIR $INSTALL_PATH
COPY . .
RUN rm -rf node_modules vendor
RUN gem install rails bundler
RUN bundle update rack-protection
RUN bundle install

RUN yarn install --production=true

# Start server
CMD bundle exec unicorn -c config/unicorn.rb
