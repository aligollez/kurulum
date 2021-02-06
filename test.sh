
#GET PHP FPM VERSION
FPMVERSION=$(find /run/php/ -name 'php7.*-fpm.sock' | head -n 1)

read -r -d '' PHPCONFIGFPM << EOM
    location ~ \.php$ { 
        try_files \$uri =404; 
        include /etc/nginx/fastcgi.conf;
        fastcgi_pass unix:$FPMVERSION; 
    }
EOM