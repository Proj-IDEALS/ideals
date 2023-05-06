# IDEALS

## _Highly-interactive concept map of learning theories_

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
* Git - [Download & Install Git](https://git-scm.com/downloads)
* Ruby  - [Download & Install Ruby](https://www.ruby-lang.org/en/documentation/installation)
* Rails - [Download & Install Rails](https://guides.rubyonrails.org/v5.1/getting_started.html#installing-rails)
* npm - [Download & Install npm](https://nodejs.org/en/download)
* yarn - [Install yarn](https://classic.yarnpkg.com/lang/en/docs/install/#mac-stable)

```sh
git clone https://github.com/Proj-IDEALS/ideals.git
cd ideals/app
bundle install
yarn install
bundle exec rails server -b 0.0.0.0
```
If you encounter issues related to webpack compilation when working with nodejs, it could be due to using an outdated version of nodejs. Specifically, you may get an error related to a missing 'manifest.json' file or a similar issue. This error is caused by webpack silently failing with code: 'ERR_OSSL_EVP_UNSUPPORTED'. To fix this issue, you should make sure to use the latest LTS version of nodejs. You can check the current LTS version on the official nodejs website. If you are using an older version, update it to the latest LTS version. Additionally, you may need to set the following command in your terminal:
```sh
export NODE_OPTIONS=--openssl-legacy-provider
```

> Note: If image loading is not working, install **libvps** library in your system

## Testing
In order to conduct automated feature testing within the developed system, a Selenium WebDriver has been employed in conjunction with the Cucumber testing framework. The Selenium WebDriver utilizes Google Chrome as the browser for executing test cases. Consequently, it is imperative that users ensure the presence of Google Chrome on their systems prior to initiating the test suite.

```sh
cd ideals/app
bundle install
yarn install
rake
```
