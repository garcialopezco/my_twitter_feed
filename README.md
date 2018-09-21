# README

Simple Microservice Endpoint built using Ruby on Rails in API mode.

This app uses a Delayed Job to retrieve recent tweets in 3 Categories(Ruby on Rails, ReactJS, Linux) every 5 minutes or so, and stores them in the database so we can query them using a REST endpoint located at

```
/tweets
```

If we want to retrieve tweets by some category we need to pass the category in the query.

```
/tweets?category=Ruby%20on%20Rails
/tweets?category=ReactJS
/tweets?category=Linux
```

### Deployment

A live version of this code could be found here:

[My Twitter Feed](https://my-twitter-feed.herokuapp.com/)

and since it is a JSON API we could use a tool like [httpie](https://my-twitter-feed.herokuapp.com/) to make some requests and examine the results, example:

```
$ http https://my-twitter-feed.herokuapp.com/tweets?category=Linux
```

### Docker

There is a branch called `dockerize-app` with a docker-compose file that could be used to test the project locally. 
