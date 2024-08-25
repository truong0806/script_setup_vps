#!/bin/bash

# Create a directory and navigate to it
mkdir mysql_phpmyadmin
cd mysql_phpmyadmin

# Create and write to docker-compose.yml
cat <<EOL > docker-compose.yml
version: "3"

services:
  # Database
  db:
    platform: linux/x86_64
    image: mysql:5.7
    volumes:
      - db_data:/var/lib/mysql
    restart: always
    ports:
      - "3306:3306"
    environment:
      MYSQL_ROOT_PASSWORD: truong911
      MYSQL_DATABASE: phongtro
      MYSQL_PASSWORD: truong911
    networks:
      - mysql-phpmyadmin

  # phpmyadmin
  phpmyadmin:
    depends_on:
      - db
    image: phpmyadmin
    restart: always
    ports:
      - "8090:80"
    environment:
      PMA_HOST: db
      MYSQL_ROOT_PASSWORD: password
    networks:
      - mysql-phpmyadmin

networks:
  mysql-phpmyadmin:

volumes:
  db_data:
EOL
