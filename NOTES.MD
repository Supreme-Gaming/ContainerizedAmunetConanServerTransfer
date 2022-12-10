#### Building

`docker build -t ghcr.io/supreme-gaming/amunet-server-transfer:latest -t ghcr.io/supreme-gaming/amunet-server-transfer:<version> .`

#### Publish

Latest: `docker push ghcr.io/supreme-gaming/amunet-server-transfer:latest`
Versioned: `docker push ghcr.io/supreme-gaming/amunet-server-transfer:<version>`

#### Running (CLI)

`docker run --name conan-server-transfer -d -p 8080:80 -v config:/var/www/html amunet-server-transfer`

#### Running (Compose)

Once the docker file :

`docker-compose up -d`
