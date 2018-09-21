# README

## Use Docker

This branch adds a Dockerfile and a docker-compose configuration so the project can be run using docker

### ENV Variables

Since I am using dotenv gem, when we copy all the settings into the docker container, the .env files is copied too soit is not necessary to add ENV variables into the docker-compose file.

The actual .env file contains the TWITTER CREDENTIALS

```bash
TWITTER_CONSUMER_KEY=key
TWITTER_CONSUMER_SECRET=secret
TWITTER_ACCESS_TOKEN=token
TWITTER_ACCESS_TOKEN__SECRET=token_secret
```

### What's Next?

Test the Deploy to Heroku
