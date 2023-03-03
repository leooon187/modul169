mkdir -p /root/uebungsprojekt/webserver
mkdir -p /root/uebungsprojekt/webserver/webserver-speicher
cd /root/uebungsprojekt/webserver
printf 'version: "3"
services:
  webserver:
    image: ltr136181/testprojekt-m169:latest
    container_name: webserver
    ports:
      - "80:80"
    volumes:
      - ./webserver-speicher:/usr/share/nginx/html
    restart: always

volumes:
  webserver-speicher:' > /root/uebungsprojekt/webserver/docker-compose.yml
printf '<html> 
    <head> 
        <title>Modul 169</title> 
    </head> 
    <body> 
        <h1>Willkommen auf meiner Seite</h1> 
        <p>Hier ist ein einfaches HTML-Skript, dies zeigt, ob der Webserver funktioniert</p>
        <p>Troeger Leon, 24.02.2023</p>
    </body> 
</html>' > /root/uebungsprojekt/webserver/webserver-speicher/index.html
docker-compose -f /root/uebungsprojekt/webserver/docker-compose.yml up -d
