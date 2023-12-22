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

docker build -t budgetbuddyweb -f dockerbuilds/webapp frontend/budgetbuddy/

docker run -d -p 80:80 --name budgetbuddyweb budgetbuddyweb