# This is a somewhat minimal image to use for your containers.

This is basically nimmis/docker-alpine-micro's
Alpine Linux base image with some modification. I loved the separation of run once & run always scripts. It relies on s simple shell script to dump the environment in /etc/envvars. All runit services you add need to source this file to gain access to the container environment. Similarly, instead of /etc/my_init.d for pre-service scripts to run, the startup shell script sequentially runs scripts found in /etc/runit_init.d.

Please feel free to use it or build upon it as needed. 

## License

[![Open Source Love](https://badges.frapsoft.com/os/mit/mit.svg?v=102)](LICENSE)

Refer `LICENSE` file in this repository.

