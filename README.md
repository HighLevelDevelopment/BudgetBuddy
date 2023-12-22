# BudgetBuddy

## Using containers

We'll make our ecossystem with containers.

### Building the API

For using docker to up our API, execute the below code to generate the image.
```
docker build -t budgetbuddyapi -f dockerbuilds/webapi backend/BudgetBuddyAPI/ --tag peedroca/budgetbuddyapi:latest
```

And start the container with:
```
docker run -d -p 8080:80 --name budgetbuddyapi budgetbuddyapi
```

### Uploading to docker hub

Create a tag for image with:
```
docker tag budgetbuddyapi:latest peedroca/budgetbuddyapi:latest
```

Sending to registry using:
```
docker push peedroca/budgetbuddyapi:latest
```
