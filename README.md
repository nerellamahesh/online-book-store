== README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## Docker

Create the Docker image and run it locally

```bash
dockerImage=angular-cosmosdb
docker build -t $dockerImage .
docker run -d -p 3000:80 $dockerImage
```

