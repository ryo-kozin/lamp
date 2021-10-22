# You can build lamp by just using docker-compose.
If you are the person who is looking for the way to create lamp server quickly, this repository is for you!!!!      
[Here is the link for lemp.](https://github.com/ryo-kozin/lemp)
    
## A must
Docker      

## Structure
| container name     | image      | function       |
| ------------------ | ---------- | --------       |
| laravel-app        | php-apache | apache, php    |
| laravel-db         | mariadb    | database       |        
| laravel-phpmyadmin | phpmyadmin | phpmyadmin     |

#php-apache (this image will be created by a Dockerfile in your docker images)  
#You don't need use laravel in this local host, names of these containers include laravel though.
    
## Network
| network name   | relation                 | driver |
| -------------- | ------------------------ | ------ |
| app-db         | apache, php - mariadb    | bridge |
| app-phpmyadmin | apache, php - phpmyadmin | bridge |
| db-phpmyadmin  | mariadb - phpmyadmin     | bridge |
    

## How to build lamp
1. `git clone https://github.com/ryo-kozin/lamp.git`    
2. `cd lamp`   
3. `docker-compose up -d`
    - If the command can't finish evne you waited for a few minuts, please try the commans below
    - `Ctrl + C`, then `docker-compose start`
    - Lamp will be built soon.
___
If you create a laravel project, keep following the commands below.    
4. `docker exec -it laravel-app bash`  
5. `composer create-project laravel/laravel {project name}`    
6. `exit`    
7. `open .env file in the project`   
8. Change the infomation.`DB_HOST = laravel-db, DB_DATABASE = user_system, DB_PASSWORD = root`     
- You can create a new database to excute commands below.    
- `docker exec -it laravel-db bash`    
- `mysql -uroot -p`    
- `root`   
- `create database {database name};`   
- `exit;`      
9. Finally open /lamp/apache/000-default.conf then chage the code.     
- From `DocumentRoot /var/www/html/test/public` to `DocumentRoot /var/www/html/{project name}/public`      
10. Access http://localhost, you can see the laravel project.
    
## URL    
localhost : http://localhost   
phpmyadmin : http://localhost:8000    

## Tips
If you set some server name, you need to chage apache/000-default.conf.
Add NameVirtualHost *:80 on the top in the file.
