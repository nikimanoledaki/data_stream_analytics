# Simple Data Stream Analytics

## Description

## Set up the application

1. Setup the container locally

```
$ docker run --name bb niki2401/data_stream_analytics:latest
$ docker-compose run --rm web bundle install
$ docker-compose run --rm web bundle exec rake db:create db:migrate
```

## Run the Rails server

```
$ docker-compose up web
```

Then, open your browser and visit [localhost:3000](http://localhost:3000).

## Run the Kafka Consumer
   
```
$ docker-compose run --rm web bundle exec racecar NodeDataConsumer
```

## Run the application

## Run the tests

Run the tests from the root of the directory with Rspec:

```
docker-compose run --rm web bundle exec rspec
```

## Design

The first step was to set up a Docker container with a Rails application, a Postgres Database, and a Kafka consumer group through Racecar. Racecar is a high-level library that uses Ruby-Kafka to integrate Kafka and Rails easily and quickly.

### Edge cases

#### Duplicates

#### Missed messages