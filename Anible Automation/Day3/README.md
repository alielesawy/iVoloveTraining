# Ansible Automation - Day 3

## Overview
This document outlines the steps to create two Ansible playbooks: one for Apache installation and another for MySQL setup. It also covers how to create an inventory file, a simple HTML page, configure the firewall, and set up Ansible Vault.

---

## Steps

1. **Create an inventory file**  
   - Write down your target hosts (e.g., `[webservers]`, `[dbservers]`).

2. **Create Apache playbook (`apache-playbook.yaml`)**  
   - Install Apache packages.  
   - Copy your `ivolve.html` to the server.  
   - Open HTTP service in the firewall (e.g., `firewalld`).

3. **Create a simple `ivolve.html`**  
   - This file will be deployed to the web server by the Apache playbook.

4. **Create MySQL playbook (`mysql.yaml`)**  
   - Install MySQL.  
   - Start and enable the service.

5. **Set up Ansible Vault**  
   - Use secrets (like DB credentials) securely in group vars or separate vault files.  
   - Example command:  
     ```bash
     ansible-vault create secrets.yml
     ```

6. **Run the playbooks**  
   - Install Apache:  
     ```bash
     ansible-playbook -i inventory apache-playbook.yaml
     ```
   - Install MySQL:  
     ```bash
     ansible-playbook -i inventory mysql.yaml
     ```

## Preview

#### Apache
- **Ansible logs**
![Apache-log](/src/Apache-logs.png)

- **Demo**
![Apache](/src/Apache-install.gif)


#### MySQL
- **Ansible logs**
![mysql-log](/src/mysql-logs.png)

- **Demo**
- - service status
![mysql-demo](/src/mysql-demo1.png)
- - root login
![mysql-demo](/src/mysql-demo2.png)
- - ivolve user login
![mysql-demo](/src/mysql-demo3.png)

