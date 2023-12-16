echo "Deploying the API"

cd repos/BudgetBuddy

sudo git checkout devops
sudo git pull

sudo docker stop budgetbuddyapi
sudo docker rm budgetbuddyapi
sudo docker rmi budgetbuddyapi

sudo docker build -t budgetbuddyapi -f dockerbuilds/webapi backend/BudgetBuddyAPI/
sudo docker run -d -p 8080:80 --name budgetbuddyapi budgetbuddyapi
