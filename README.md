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
1. Test if local setup succeeded using WhoAmI sandbox server
    ```bash
    $ http 'http://proxy-test-hip.docker.localhost/api'                                                                                                                  [21:53:52]
    HTTP/1.1 200 OK
    Content-Length: 439
    Content-Type: application/json
    Date: Sun, 17 Oct 2021 18:54:05 GMT

    {
        "headers": {
            "Accept": [
                "*/*"
            ],
            "Accept-Encoding": [
                "gzip, deflate"
            ],
            "User-Agent": [
                "HTTPie/2.4.0"
            ],
            "X-Forwarded-For": [
                "172.16.200.1"
            ],
            "X-Forwarded-Host": [
                "proxy-test-hip.docker.localhost"
            ],
            "X-Forwarded-Port": [
                "80"
            ],
            "X-Forwarded-Proto": [
                "http"
            ],
            "X-Forwarded-Server": [
                "hip-proxy"
            ],
            "X-Real-Ip": [
                "172.16.200.1"
            ]
        },
        "host": "proxy-test-hip.docker.localhost",
        "hostname": "hip-proxy-test",
        "ip": [
            "127.0.0.1",
            "172.16.200.200"
        ],
        "method": "GET",
        "url": "/api"
    }
    
    ```

## Dependencies used
* [Ansible](https://docs.ansible.com/ansible/latest/) automation tool
* [Docker](https://docs.docker.com)
* [Docker Compose](https://docs.docker.com/compose)
* Docker containers
    * [Redis](https://redis.io/documentation)
    * [NGINX](https://nginx.org/en/docs/) web server
    * PHP-FPM CGI
    * [Traefik](https://doc.traefik.io/traefik/)
    * Traefik [WhoAmI test server](https://github.com/traefik/whoami)
* [Vagrant](https://www.vagrantup.com/)


## Useful info
* [Local Traefik dashboard](http://localhost:8080/dashboard/), if enabled by api.insecure flag in config
* [WhoAmI sandbox](proxy-test-hip.docker.localhost)
* See currently used [Traefik config](http://localhost:8080/api/rawdata) in raw format
* To customize to your needs Docker Compose config setup to your specific local environment use `docker-compose.override.yaml` file. It won't be added to GIT
