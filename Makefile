PATH_YML = ./srcs/docker-compose.ylm
MARIADB_PATH = /home/hugo/data/mariadb
WORDPRESS_PATH = /home/hugo/data/wordpress

all:
	@ sudo mkdir -p $(MARIADB_PATH)
	@ sudo mkdir -p $(WORDPRESS_PATH)
	@ sudo chmod 777 $(MARIADB_PATH)
	@ sudo chmod 777 $(WORDPRESS_PATH)
	@ sudo docker-compose -f $(PATH_YML) up -d --build

re: clean all

stop:
	@ sudo docker-compose -f $(PATH_YML) stop

clean: stop
	@ sudo docker-compose -f $(PATH_YML) down -v

fclean: clean
	@ sudo rm -rf $(WORDPRESS_PATH)
	@ sudo rm -rf $(MARIADB_PATH)
	@ sudo docker system prune -af