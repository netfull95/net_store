
up:
	docker-compose up -d
stop:
	docker-compose stop
	docker rm -f $(docker ps -a | grep netstore_app | awk '{print $1}') || echo "\n\n >bash stoped before\n\n"
app:
	docker rm -f netstore_phoenix_1; docker-compose run --name netstore_app --rm -p 8880:4000 phoenix iex -S mix phx.server
bash:
	docker-compose run phoenix bash
format:
	mix format mix.exs “lib/**/*.{ex,exs}”