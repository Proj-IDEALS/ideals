# IDEALS

## _Highly-interactive concept map of relationships between learning theories_

[![CI Pipeline - DEVELOPMENT](https://github.com/Proj-IDEALS/ideals/actions/workflows/development-pipeline.yml/badge.svg)](https://github.com/Proj-IDEALS/ideals/actions/workflows/development-pipeline.yml) [![CI/CD Pipeline - RELEASE](https://github.com/Proj-IDEALS/ideals/actions/workflows/release-pipeline.yml/badge.svg)](https://github.com/Proj-IDEALS/ideals/actions/workflows/release-pipeline.yml) [![Dev Pipeline - Deploy to Azure Web App Service](https://github.com/Proj-IDEALS/ideals/actions/workflows/Deploy-to-azure-dev.yml/badge.svg)](https://github.com/Proj-IDEALS/ideals/actions/workflows/Deploy-to-azure-dev.yml)


## Usage

#### With Docker-compose
IDEALS uses Rails + Docker for fast development.
Make a change in your file and instantaneously see your updates!

Open your favourite Terminal and run these commands.

```sh
git clone https://github.com/Proj-IDEALS/ideals.git
cd ideals
docker-compose -f docker-compose.dev.yml up --build
```

#### Without Docker-compose
##### Prerequisites
Make sure you have installed all of the following prerequisites on your development machine:
* Git - [Download & Install Git](https://git-scm.com/downloads). OSX and Linux machines typically have this already installed.
* Ruby  - [Download & Install Ruby](https://www.ruby-lang.org/en/documentation/installation/). OSX machines typically have this already installed. 
* Rails - [Download & Install Rails](https://guides.rubyonrails.org/v5.1/getting_started.html#installing-rails)
* npm - [Download & Install npm](https://nodejs.org/en/download/)

```sh
git clone https://github.com/Proj-IDEALS/ideals.git
cd ideals/app
bundle install
bundle exec rails server -b 0.0.0.0
```
> Note: `export NODE_OPTIONS=--openssl-legacy-provider` is required if the webpack fails with code: 'ERR_OSSL_EVP_UNSUPPORTED'.
> If image loading is not working, install libvps library in your system

##### JavaScript Tests
Make sure you have following libraries installed if you are running JS tests

###### Mac
```sh
brew install pkg-config cairo pango libpng jpeg giflib librsvg
```

###### Ubuntu
```sh
sudo apt-get install build-essential libcairo2-dev libpango1.0-dev libjpeg-dev libgif-dev librsvg2-dev
```
