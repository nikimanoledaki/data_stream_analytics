# Simple Data Stream Analytics

## Description

## Set up the application

1. Setup the container locally

```
$ docker pull niki2401/data_stream_analytics:latest
$ docker-compose run --rm web bundle install
$ docker-compose run --rm web bundle exec rake db:create db:migrate
```

## Run the application
Run the Kafka Consumer
   
```
$ docker-compose run --rm web bundle exec racecar NodeDataConsumer
```

## Run the tests

Run the tests from the root of the directory with Rspec:

```
docker-compose run --rm web bundle exec rspec
```

## Process
The first step was to set up a Docker container with a Rails application, a Postgres Database, and a Kafka consumer group based on the Racecar gem. Racecar is a high-level library that uses Ruby-Kafka to integrate Kafka and Rails easily and quickly.

## Design


### Edge cases
- Assumptions: data is new and not duplicated, data is not missing, data is received in JSON format.
- Node_id Long integer 8-byte
