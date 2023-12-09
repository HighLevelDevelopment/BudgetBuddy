# BudgetBuddy

## Using containers
For using docker to up our API, execute the below code to generate the image.
```
docker build -t budgetbuddy -f dockerbuilds/webapi backend/BudgetBuddyAPI/
```

And start the container with:
```
docker run -d -p 8080:80 --name budgetbuddyapi budgetbuddy
```
