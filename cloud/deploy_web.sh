echo "Deploying the API"

cd repos/BudgetBuddy

sudo git checkout devops
sudo git pull

sudo docker stop budgetbuddyweb
sudo docker rm budgetbuddyweb
sudo docker rmi budgetbuddyweb

sudo docker build -t budgetbuddyweb -f dockerbuilds/webapp frontend/budgetbuddy/
sudo docker run -d -p 80:80 --name budgetbuddyweb budgetbuddyweb
