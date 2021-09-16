# You can build lamp that is activated ssl by just using docker-compose.
If you are the person who is looking for the way to create lamp server that is activated ssl quickly, this repository is for you!!!!      
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
    
## Network
| network name   | relation                 | driver |
| -------------- | ------------------------ | ------ |
| app-db         | apache, php - mariadb    | bridge |
| app-phpmyadmin | apache, php - phpmyadmin | bridge |
| db-phpmyadmin  | mariadb - phpmyadmin     | bridge |
    

## How to build lamp
1. `git clone https://github.com/ryo-kozin/lamp.git`    
2. `cd lamp/apache/ssl`
3. Create SSLCertificateFile and SSLCertificateKeyFile by yourself. 
    - I usually use mkcert.     
4. Match the names of the files # SSL below in lamp/docker-compose.yml.
5. Match the names of the server name in 000-default.conf.
```e.g.
ServerName {your server name}

------
RewriteEngine on
RewriteCond %{HTTP_HOST} ^{Second-level domain}\.{Top-level domain}
RewriteRule ^/(.*)$ https://{Second-level domain}.{Top-level domain}/$1 [R=301,L] 
------
SSLEngine on
SSLCertificateFile  /etc/apache2/ssl/{SSLCertificateFile}
SSLCertificateKeyFile /etc/apache2/ssl/{SSLCertificateKeyFile}
```
6. Set the server name that you want to use in hosts file in your computer. 
    - e.g. 127.0.0.1 example.com 
7. `docker-compose up -d`
    - If the command can't finish evne you waited for a few minuts, please try the commans below.
    - `Ctrl + C`, then `docker-compose start`
    - Lamp will be built soon.       
8. `docker exec -it laravel-app bash`  
9. `composer create-project laravel/laravel {project name}`    
10. `exit`    
11. `open .env file in the project`   
12. Change the infomation.`DB_HOST = laravel-db, DB_DATABASE = user_system, DB_PASSWORD = root`     
    - You can create a new database to excute commands below.    
    - `docker exec -it laravel-db bash`    
    - `mysql -uroot -p`    
    - `root`   
    - `create database {database name};`    
    - `exit;`      
13. Finally open /lamp/apache/000-default.conf then chage the code.     
    - From `DocumentRoot /var/www/html/example/public` to `DocumentRoot /var/www/html/{project name}/public`         
14. Access https://localhost, you can see the laravel project.
15. Write the codes below in {project name}/App/Providers/AppServiceProvider.php.
```
use Illuminate\Routing\UrlGenerator;

public function boot(UrlGenerator $url)
{
    $url->forceScheme('https');
}
```
## URL    
localhost : https://localhost   
phpmyadmin : https://localhost:8000   
