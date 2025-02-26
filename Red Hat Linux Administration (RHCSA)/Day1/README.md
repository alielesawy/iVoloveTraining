
# Day 1
![Red Hat Logo](/src/icons8-redhat-96.png)

## Lab 1
- Create a group named `ivolve`:
  ```sh
  sudo groupadd ivolve
  ```

- Create a user `aly` with home directory, add to `ivolve` group, and set bash as the default shell:
  ```sh
  sudo useradd -m -G ivolve -s /bin/bash aly
  ```

- Set password for user `aly`:
  ```sh
  sudo passwd aly
  ```

- Edit sudoers file to allow `aly` to install nginx without a password:
  ```sh
  sudo visudo
  ```
  Add the following line:
  ```
  aly ALL=(ALL) NOPASSWD: /usr/bin/dnf install nginx
  ```
### ScreenShots for soloution 

- ![Sol2](/src/Day1Lab11.png)

- ![Sol1](/src/Day1Lab1.png)

------------------------------------------
## Lab 2 Backup for mysql

- Update pakages and install mySQL.

```
sudo apt update
sudo apt install mysql-server -y
```

- Start and Enable MySQL Service

```
sudo systemctl start mysqld
sudo systemctl enable mysqld
```
- Creating Backup

```
mkdir -p ~/mysql_backups
```
```
vim ~/mysql_backups/backup_databases.sh
```
#### Script 
```
#!/bin/bash

USER="********"
PASSWORD="******"

BACKUP_DIR=~/mysql_backups

DATE=$(date +'%Y-%m-%d_%H-%M-%S')

BACKUP_FILE="$BACKUP_DIR/all_databases_$DATE.sql"

mysqldump -u $USER -p$PASSWORD --all-databases > $BACKUP_FILE

```
- make script executable 
```
chmod +x ~/mysql_backups/backup_databases.sh
```

#### Scheduling 

- configure ``` crontab -e ``` with this line 
```
0 5 * * 0 ~/mysql_backups/backup_databases.sh
```

- test script 
``` 
 ~/mysql_backups/backup_databases.sh
```
- you MUSTN'T put credentials at the script 

