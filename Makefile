build:
	git pull
	docker build -t local/runner .

run:
	sudo chmod o+rw /var/run/docker.sock
	git pull

	docker run -v /var/run/docker.sock:/var/run/docker.sock --name=runner-1 --restart always -d -e ORG=https://github.com/wmp-v2 -e NAME=runner-1 -e TOKEN=$(runner_token) local/runner

	docker run -v /var/run/docker.sock:/var/run/docker.sock --name=runner-2 --restart always -d -e ORG=https://github.com/wmp-v2 -e NAME=runner-2 -e TOKEN=$(runner_token) local/runner

	docker run -v /var/run/docker.sock:/var/run/docker.sock --name=runner-3 --restart always -d -e ORG=https://github.com/wmp-v2 -e NAME=runner-3 -e TOKEN=$(runner_token) local/runner


