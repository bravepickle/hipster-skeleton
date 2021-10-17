# hipster-skeleton
Skeleton for development of web application in local and remote setup with nifty approach

## File Hiearchy Structure
Current project's file structure is as follows

* *bin* - scripts to run for setting up application
* *data* - client applications, source code, data to setup etc.
* *etc* - configs for applications environment, e.g. components, Docker containers and GIT repos
* *host* - configs for host setup to prepare local environment
* *var* - folder for temporary files, e.g. builds, temporary files
* *dot-files* - dot-files to add to user account
* *docker-compose.override.dist.yaml* - example file that can be copied and customized for Docker Commpose configs to `docker-compose.override.yaml`
* *.env.dist* - example file that can be copied and customized for Docker Commpose and other configs to `.env`
* *Vagrantfile.dist* - example file that can be copied and customized for Vagrant configs to `Vagrantfile`, if will be used


## Installation
1. Install manually Docker and Docker Compose to your machine or server
1. Copy `.env.dist` to `.env` and customize it
1. Copy `docker-compose.override.dist.yaml` to `docker-compose.override.yaml` and customize it (optional)
1. Run `docker-comppose up` from project's root folder
