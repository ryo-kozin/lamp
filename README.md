You can build laravel   

#containers   
app -> php    
db -> mariadb   
phpmyadmin -> phpmyadmin    
nginx -> nginx

#how to build   
1.git clone https://github.com/ryo-kozin/docker_laravel.git   
2.cd docker_laravel   
3.docker-compose up -d    
4.docker exec -it laravel-app bash    
5.comopser create-project laravel/laravel {project name}    
6.exit    
7.open .env file in the project   
8.DB_HOST = laravel-db, DB_DATABASE = user_system, DB_PASSWORD = root   
    
#URL    
Laravel project URL http://localhost   
phpmyadmin URL http://localhost:8000    
