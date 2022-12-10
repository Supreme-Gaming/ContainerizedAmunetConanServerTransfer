# Amunet's Server Transfer Utility

This is a simple containerized implementation for Amunet's Server Transfer Utility:

https://steamcommunity.com/workshop/filedetails/discussion/2305969565/2968398851791582758/

## Motivation

Setting up an environment with Docker and Docker Compose may be just as complicated as setting up an Apache/NGINX server with PHP but with many cloud providers offering ready-to-use Docker and Docker Compose VM's and Docker officially providing a self-service installer for Windows machines, the process of getting that setup is very straight forward. From then on, any containerized application can be run with simple commands. The benefits include:

- Encapsulated applications.
  - No need to install a web server + php on a host OS
- Easy application version upgrades. Just change the version tag when running a container.
- The setup for an application is contained in a Docker image, so all the setup for each application afterwards is abstracted. Simply provide whatever config or variables and you're off to the races.

## Using

The recommended way to run this is with Docker Compose. Docker Compose uses the `docker-compose.yml` file with pre-defined variables and environment configurations for an application. It is a much easier than typing out a command and making sure you got it right every single time you want to spin up a container.

A host with docker compose is required. From then:

- Take the sample [docker-compose.yml](docker-compose.yml) and drop it somewhere in the system
- Edit as needed or you can use it as is with recommended defaults
- Open up a console window or change the working directory to wherever you placed the file and run the command `docker-compose up -d`

That's it. Apache with PHP is now running in the container and the application files have been placed in the right place. Assuming a default docker compose config, you can access it [http://localhost:8080](http://localhost:8080).

## Update the cluster.ini

This is probably the hardest part of the entire process. The `cluster.ini` file is in a docker volume for persistency across container restarts and to edit it you will need to "jump into" the VM and edit the config through a console-based text editor (nano). To do so, assuming default container names:

- Open any terminal window on the docker host
- Run `docker exec -it conan_server_transfer /bin/bash`. At this point you are now operating inside the container and in the `/var/www/html` directory.
- Open up the `cluster.ini` config with `nano cluster.ini`.
- Edit config as needed. `nano` is fairly user-friendly and allows copying and pasting directly from the console. You can take advantage of this and edit on a local system with an editor of your choice.
- When done, press `CTRL + X` and press `Y` to write changes to file.
- Done

---

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
