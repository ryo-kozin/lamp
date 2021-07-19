# You can build lamp by just using docker-compose.
If you are the person who is looking for the way to create lamp server quickly, this repository is for you!!!!      
[Here is the link for lemp.](https://github.com/ryo-kozin/lemp)

## A must
Docker  

## Sturucture
| container name | image      | function       |
| -------------- | ---------- | --------       |
| app            | php-apache | apache and php |
| db             | mariadb    | database       |        
| phpmyadmin     | phpmyadmin | phpmyadmin     |

#php-apache (this image will be created by a Dockerfile in your docker images)    

## Network
|
|


## How to build a laravel app
1.git clone https://github.com/ryo-kozin/docker_laravel.git   
2.cd docker_laravel   
3.docker-compose up -d    
4.docker exec -it laravel-app bash    
5.comopser create-project laravel/laravel {project name}    
6.exit    
7.open .env file in the project   
8.DB_HOST = laravel-db, DB_DATABASE = user_system, DB_PASSWORD = root   
    
## URL    
localhost URL http://localhost   
phpmyadmin URL http://localhost:8000    
