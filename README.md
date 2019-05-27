## EventRock with GraphQL and Ruby

This  Application is a graphql backend application for event creation
- Users can signup and login
- Login users can create events
- Login users can delete and update event
- Users can register for the event

Things you may want to cover:

### Ruby version
  - v2.53

### Setup
- CLone this application
- Create application.yml file and add the following variables
```
JWT_SECRET=
PG_USER=
PG_PASSWORD=
```
- Run `rails db:create` to create database
- Run `rails db:migrate` to run migrations
- Run `bundle install` to run all dependencies
- finally run `rails s` to start the server
- visit `localhost:3000/graphiql` to run queries

### Database creation
```
rails db:create
```
* Database initialization
#### Run migration using

```
rails db:migrate
```
* How to run the test suite\
rspec

## Limitation
Still in Development

## Contribution
- Clone this Repository and raise a pull request

