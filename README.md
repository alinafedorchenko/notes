# README

run: 
    
    cd ~/notes

    docker build .

    docker-compose run web bundle instal

    docker-compose run web rails db:setup

    docker-compose up