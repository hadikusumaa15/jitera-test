# recipes

## Table of Contents

- [Requirements](##requirements)
- [Initialization](##initialization)
- [Setup](##setup)
- [Deployment](##deployment)
- [Supplement](##supplement)

## Requirements

- Docker 19.x
  If you run the project locally, the followings are required.
- Ruby 3.0.0
- Bundler 2.1.x
- Node.js 14.15.1
- Yarn 1.22.x
- MySQL 8.0.x

## Setup

Setup procedure of development environment.
Run `cp env.example .env` and open `.env` file to edit environment variables.

### Docker environment

Build docker containers

```bash
docker-compose build
```

Initialize

```bash
docker-compose run web ruby ./bin/initialize
```

Setup database

```bash
docker-compose run web bundle exec rake db:create db:migrate db:seed
```

Start the app

```bash
docker-compose up
```

### Local environment

Install dependencies

````bash
## Install gems
bundle install
Start mysql and setup database
```bash
bin/rake db:create db:migrate db:seed
````

Start the app

```bash
## API server
bin/rails s
```

Start console

```bash
bin/rails c
```

## Deployment

Once you created the staging and production environments in Jitera's DevOps menu, you can deploy to staging by pushing a new commit to `develop` branch, and to production by pushing a new commit to `master` branch.

## Supplement

This project was generated by jitera automation, run by Jitera.

## Updates

- 100% rspec fixed and adjusted
- add user management controllers
