# Lab 3
### Shell Scripting Basics
#### Objective: Create a shell script that would ping every single server in the 172.16.17.x subnet where x is a number between 0 and 255. If a ping succeeds,statement "Server 172.16.17.x is up and running" will be displayed. Otherwise, if a ping fails, statement "Server 172.16.17.x is unreachable" will be displayed.

- Define the subents
- Create script file 

```
#!/bin/bash

subnet="172.25.250"

for host in {0..255}; do

  ip="$subnet.$host"
  
    if ping -c 1 -W 1 "$ip" &> /dev/null; then
    echo "Server $ip is up and running" >> runningServers
  else
    echo "Server $ip is unreachable" >> unreachable
  fi
done
```

#### ScreenShots

- running servers
![Lab3](/src/lab3-1.png)

- unreachable servers
![lab3](/src/lab3-2.png)