# docker-ntfy
Notification server using ntfy.sh

## Server setup
1. Initialize config by running init.sh: `./init.sh`
1. Input your domain name into `.env`
1. Make sure that Docker network `traefik` exists, `docker network ls`
1. Run `docker compose up` and check logs

## Server config
### Manage users/access
Users and access needs to be managed from within the docker container  

* Get shell inside the container: `docker compose exec ntfy /bin/sh`
* Show users: `ntfy user list`
* Add user: `ntfy user add <user>`
* Add access to user: `ntfy access <user> <rw|ro|wo|deny>`
* Help: `ntfy <user|access> -h`

## Client setup
### Debian/Ubuntu repository:
```
sudo mkdir -p /etc/apt/keyrings  

curl -fsSL https://archive.heckel.io/apt/pubkey.txt | sudo gpg --dearmor -o /etc/apt/keyrings/archive.heckel.io.gpg

sudo apt install apt-transport-https

sudo sh -c "echo 'deb [arch=amd64 signed-by=/etc/apt/keyrings/archive.heckel.io.gpg] https://archive.heckel.io/apt debian main' > /etc/apt/sources.list.d/archive.heckel.io.list"

sudo apt update

sudo apt install ntfy

sudo systemctl enable ntfy

sudo systemctl start ntfy
```
## Client config
* User config: ~/.config/ntfy/client.yml
* Root config: /etc/ntfy/client.yml  

Basic parameters are `default-host`, `default-user` and `default-password`.

## Reference
Documentation: https://docs.ntfy.sh/  
Server config: https://github.com/binwiederhier/ntfy/blob/main/server/server.yml  
Client config: https://github.com/binwiederhier/ntfy/blob/main/client/client.yml