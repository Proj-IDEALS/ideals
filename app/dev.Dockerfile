# prod.Dockerfile development version
FROM ruby:3.1.3 AS ideals-development

RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -\
  && apt-get update -qq && apt-get install -qq --no-install-recommends \
    nodejs \
  && apt-get upgrade -qq \
  && apt-get clean \
  && apt-get install -y libvips \
  && rm -rf /var/lib/apt/lists/*\
  && npm install -g yarn@1

RUN apt-get update \
    && apt-get install -y build-essential libcairo2-dev \
    libpango1.0-dev libjpeg-dev libgif-dev librsvg2-dev

# Default directory
ENV INSTALL_PATH /opt/app
ENV RAILS_ENV development
ENV NODE_OPTIONS --openssl-legacy-provider

RUN mkdir -p $INSTALL_PATH

# Install gems
WORKDIR $INSTALL_PATH
COPY . .
RUN rm -rf node_modules
RUN gem install rails bundler
RUN bundle install

RUN yarn install

EXPOSE 3000

# Start server
CMD bundle exec rails server -b 0.0.0.0
