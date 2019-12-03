# raspberrypi
raspberrypi project

## v1.1
DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.

### How do i use this raspberrypi project?
1. Clone this repository in your local machine
2. Fill the .envs files as you need
3. Login in the raspberry as pi
4. Copy the repository folder in /home/pi, for example, with scp
5. Run adduser.sh
6. Log out and in with new user
7. Copy the repository folder in /home/newuser, for example, with scp
8. Then run removepi.sh, config.sh, install_all_software.sh

### .envs files
To use the .env files, there is 3 .env file required:

**software/.env**

    # git
    NAME=
    EMAIL=

**docker/.env**

    # volumes
    VOLUMES=

    # pihole
    PIHOLEWEBPASSWORD=
    TIMEZONE=

**config/.env**

    # adduser
    USERNAME=""
    PASSWORD=""
    GROUPS=""
    PUBLICKEY=""

    # config
    HOSTNAME=""
    HDDUUID=""
    MOUNTPOINT=""
    DHCPCD=""