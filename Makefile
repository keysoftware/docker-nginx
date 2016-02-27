NS       := keysoftware
NAME     := nginx
PORT_80  := 4910
PORT_443 := 4911

.PHONY: build
build:
	docker build -t $(NS)/$(NAME) -f Dockerfile .

.PHONY: clean
clean:
	docker stop $(NS)_$(NAME)
	docker rm $(NS)_$(NAME)

.PHONY: clean-image
clean-image:
	docker rmi $(NS)/$(NAME)
	
.PHONY: exec
exec:
	docker exec -it $(NS)_$(NAME) bash

.PHONY: run
run:
	docker run -d --name $(NS)_$(NAME) -p $(PORT_80):80 -p $(PORT_443):443 $(NS)/$(NAME)
	docker ps -a
