# Simple Data Stream Analytics

## Design

The first step was to set up a Docker container with a Rails application, a Postgres Database, and a Kafka consumer group through Racecar. Racecar is a high-level library that uses Ruby-Kafka to integrate Kafka and Rails easily and quickly.

## Set up the application

1. Setup the container locally

```
$ docker-compose run --rm web rails new . --force --no-deps --database=postgresql

# $ docker-compose run --rm -u root web bash -c "mkdir -p /bundle/vendor && chown railsuser /bundle/vendor"

$ docker-compose run --rm web bundle install
$ docker-compose run --rm web bundle exec rake db:setup
```

2. Run the server

```
$ docker-compose up web
```

Then, open your browser and visit [localhost:3000](http://localhost:3000).

## Run the application

## Run the tests

Run the tests from the root of the directory with Rspec:

```
bundle exec rspec
```
