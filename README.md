# BudgetBuddy

## Using containers
For using docker to up our API, execute the below code to generate the image.
```
docker build -t budgetbuddyapi -f dockerbuilds/webapi backend/BudgetBuddyAPI/
```

And start the container with:
```
docker run -d -p 8080:80 --name budgetbuddyapi budgetbuddyapi
```

docker tag budgetbuddyapi:latest peedroca/budgetbuddyapi:latest

docker push peedroca/budgetbuddyapi:latest

docker run -d -p 8080:80 --name budgetbuddyapi peedroca/budgetbuddyapi:latest
