mkdir -p /root/uebungsprojekt/datenbank
mkdir -p /root/uebungsprojekt/datenbank/datenbank-speicher
cd /root/uebungsprojekt/datenbank  
printf 'version: "3"
services:
  datenbank:
    image: ltr136181/testprojekt-m169d:latest
    container_name: datenbank
    environment:
      MYSQL_ROOT_PASSWORD: datenbank
      MYSQL_DATABASE: datenbank
      MYSQL_USER: datenbank
      MYSQL_PASSWORD: datenbank
    volumes:
      - datenbank-speicher:/var/lib/mysql
    ports:
      - "3306:3306"

  datenbank-verwaltung:
    image: adminer
    container_name: datenbank-verwaltung
    ports:
      - "8080:8080"
    restart: always

volumes:
  datenbank-speicher:' > /root/uebungsprojekt/datenbank/docker-compose.yml
docker-compose -f /root/uebungsprojekt/datenbank/docker-compose.yml up -d
