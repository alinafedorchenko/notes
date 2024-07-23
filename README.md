# README

run: 
    
    cd ~/notes

    docker build .

    docker-compose run web rails db:setup

    docker-compose up