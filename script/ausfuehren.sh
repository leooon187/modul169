mkdir -p /root/uebungsprojekt/inhaltsverwaltungssystem
mkdir -p /root/uebungsprojekt/inhaltsverwaltungssystem/datenbank-speicher
mkdir -p /root/uebungsprojekt/inhaltsverwaltungssystem/inhaltsverwaltungssystem-speicher
cd /root/uebungsprojekt/inhaltsverwaltungssystem  
printf 'version: "3"
services:
  datenbank:
    image: ltr136181/mysql-m169:latest
    container_name: datenbank
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: inhaltsverwaltungssystem
      MYSQL_DATABASE: inhaltsverwaltungssystem
      MYSQL_USER: inhaltsverwaltungssystem
      MYSQL_PASSWORD: inhaltsverwaltungssystem
    volumes:
      - datenbank-speicher:/var/lib/mysql

  datenbank-verwaltung:
    image: ltr136181/adminer-m169:latest
    container_name: datenbank-verwaltung
    restart: always
    ports:
      - "8080:8080"

  inhaltsverwaltungssystem:
    image: ltr136181/wordpress-m169:latest
    container_name: inhaltsverwaltungssystem
    restart: always
    ports:
      - "80:80"
    environment:
      WORDPRESS_DB_HOST: datenbank
      WORDPRESS_DB_USER: inhaltsverwaltungssystem
      WORDPRESS_DB_PASSWORD: inhaltsverwaltungssystem
      WORDPRESS_DB_NAME: inhaltsverwaltungssystem
    volumes:
      - inhaltsverwaltungssystem-speicher:/var/www/html

volumes:
  datenbank-speicher:
  inhaltsverwaltungssystem-speicher:' > /root/uebungsprojekt/inhaltsverwaltungssystem/docker-compose.yml
docker-compose -f /root/uebungsprojekt/inhaltsverwaltungssystem/docker-compose.yml up -d
