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
1. Generate SSL certificates by running command `bin/make_self_signed_cert.sh`. These files must be created before starting Docker containers and script rerun after APP_HOST changed in `.env` config. This is important when working under HTTPS
1. Copy `docker-compose.override.dist.yaml` to `docker-compose.override.yaml` and customize it (optional)
1. Run `docker-comppose up` from project's root folder
1. Test if local setup succeeded using WhoAmI sandbox server
    ```bash
    $ curl -i 'http://hipster.localhost' -H 'Host: proxy-test-hipster'

    HTTP/1.1 200 OK
    Content-Length: 376
    Content-Type: text/plain; charset=utf-8
    Date: Fri, 22 Oct 2021 23:02:01 GMT

    Hostname: hipster-proxy-test
    IP: 127.0.0.1
    IP: 172.16.200.200
    RemoteAddr: 172.16.200.100:50394
    GET / HTTP/1.1
    Host: proxy-test-hipster
    User-Agent: curl/7.64.1
    Accept: */*
    Accept-Encoding: gzip
    X-Forwarded-For: 172.16.200.1
    X-Forwarded-Host: proxy-test-hipster
    X-Forwarded-Port: 80
    X-Forwarded-Proto: http
    X-Forwarded-Server: hipster-proxy
    X-Real-Ip: 172.16.200.1
    
    ```

## Links
List of default links and interfaces available for the app.

* Adminer: https://localhost:9090
* Web server: https://localhost
* Traefik dashboard: http://localhost:8080/dashboard/
* MySQL/Percona DB connection: localhost:3306
* WhoAmI sandbox environment for testing Traefik routing: https://localhost/whoami/

## Dependencies used
* [Ansible](https://docs.ansible.com/ansible/latest/) automation tool
* [Docker](https://docs.docker.com)
* [Docker Compose](https://docs.docker.com/compose)
* Docker containers
    * [Redis](https://redis.io/documentation)
    * [NGINX](https://nginx.org/en/docs/) web server
    * PHP-FPM CGI
    * [Traefik](https://doc.traefik.io/traefik/) reverse proxy
    * Traefik [WhoAmI](https://github.com/traefik/whoami) test server
    * [Adminer](https://www.adminer.org/) DB client user interface
* [Vagrant](https://www.vagrantup.com/)

## Installing self-signed SSL certificates
1. Install openSSL library
    1. [Windows complete package .exe installer](http://gnuwin32.sourceforge.net/packages/openssl.htm)
    1. [Homebrew](https://brew.sh/): `brew install openssl`
    1. Ubuntu Linux distros: `apt-get install openssl`
1. Run command on host machine `bin/make_self_signed_cert.sh`

## Scripts
There are some shell scripts with useful utilities in folder `bin`. For development purposes only!

* `make_self_signed_cert.sh` - make self-signed SSL certificate and private key and put it to `var/ssl-certs` folder
* `test_proxy.sh` - run a few CURL console commands to test server environment setup
* `build_docker_containers_multi_arch.sh` - build custom containers for multiple CPU architectures and push to the registry. Note: after copying contents should be updated to push to the right registry and change container builds


## Useful info
* Local [Traefik web UI dashboard](http://localhost:8080/dashboard/), if enabled by api.insecure flag in config
* [WhoAmI sandbox](proxy-test-hip.docker.localhost)
* See currently used [Traefik config](http://localhost:8080/api/rawdata) in raw format
* To customize to your needs Docker Compose config setup to your specific local environment use `docker-compose.override.yaml` file. It won't be added to GIT
* See usage `host.docker.internal` and `gateway.docker.internal` hosts usage within Docker containers, e.g. https://docs.docker.com/desktop/mac/networking/. If you need to access to host machine from within container in developer's environment then it may help. Be aware that in production mode it can be disabled!
* Build custom images for multiple platform using [Buildx](https://docs.docker.com/buildx/working-with-buildx/). Read also [multi-platform usage](https://github.com/docker/build-push-action/blob/master/docs/advanced/multi-platform.md) instructions (consider using [docker-container](https://github.com/docker/buildx/blob/master/docs/reference/buildx_create.md#driver) driver instead of default `docker` one)
* [Self-signed SSL certificates docs](https://devcenter.heroku.com/articles/ssl-certificate-self)

## Troubleshooting
* Remember to generate SSL certificates if they are used and check if they are installed-configured properly before starting
* Think of adding used application host name to `hosts` file on your host machine. Should be the same as the one defined in `.env` file under `APP_HOST` environment variable
* If browser does not show button to bypass insecure SSL connection (e.g. in Chrome under MacOS error "NET::ERR_CERT_INVALID") then one can either add to trusted certificates list given certificate or type "thisisunsafe" (in Google Chrome. See [this link](https://dblazeski.medium.com/chrome-bypass-net-err-cert-invalid-for-development-daefae43eb12) to learn more)

## TODO
- [x] figure out why docker hub allows only one architecture specified per tag and fix it
- [x] figure out why custom request and response headers are not displayed. It seems that middleware not working at all for some reason
