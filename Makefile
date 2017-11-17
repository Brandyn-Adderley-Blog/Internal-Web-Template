include .env

setup:
	mkdir src src/static config db

create_project:
	docker-compose run web django-admin.py startproject $(DJANGOAPP_NAME) .

build:
	docker-compose build

create_app:
	docker-compose run web python manage.py startapp $(app)

migrate_data:
	docker exec -it djangoweb_01 python manage.py makemigrations
	docker exec -it djangoweb_01 python manage.py migrate

collectstatic:
	docker-compose exec web python manage.py collectstatic

unit_test:
	docker-compose exec web python manage.py test

up:
	docker-compose up -d

down:
	docker-compose down

start:
	docker-compose start

stop:
	docker-compose stop

bash-web:
	docker exec -it djangoweb_01 bash

bash-db:
	docker exec -it postgresdb_01 bash

log-web:
	docker-compose logs web

log-db:
	docker-compose logs db
