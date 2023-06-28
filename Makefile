CMD_PATH = ./srcs/docker-compose.yml
MARIADB_VLM = /home/hspriet/data/mariadb
WORDPRESS_VLM = /home/hspriet/data/wordpress

all :
	sudo mkdir -p $(MARIADB_VLM)
	sudo mkdir -p $(WORDPRESS_VLM)
	sudo chmod 777 $(MARIADB_VLM)
	sudo chmod 777 $(WORDPRESS_VLM)
	sudo docker-compose -f $(CMD_PATH) up -d --build

re : clean all

stop:
	sudo docker-compose -f $(CMD_PATH) stop

clean : stop
	sudo docker-compose -f $(CMD_PATH) down -v

fclean : clean
	sudo rm -rf $(MARIADB_VLM)
	sudo rm -rf $(WORDPRESS_VLM)
	sudo docker system prune -af
