## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![](https://github.com/Jacob4681/Project-1-ELK-Stack/blob/main/Diagrams/Network-Diagram.draw.io.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the Ansible file may be used to install only certain pieces of it, such as Filebeat.

  - [DVWA Webserver Playbook](https://github.com/Jacob4681/Project-1-ELK-Stack/blob/main/Ansible/DVWAwebserverplaybook.yml.txt)
  - [ELK Stack Playbook](https://github.com/Jacob4681/Project-1-ELK-Stack/blob/main/Ansible/ELKplaybook.yml.txt)
  - [Filebeat Playbook](https://github.com/Jacob4681/Project-1-ELK-Stack/blob/main/Ansible/Filebeat-playbook.yml.txt)
  - [Metricbeat Playbook](https://github.com/Jacob4681/Project-1-ELK-Stack/blob/main/Ansible/Metricbeat-playbook.yml.txt)

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.
- Load Balancers protect the system from DDoS attacks. The advantage of a Jump Box is all admins have to connect to it before any tasks in administration. All of the tools are on one server. This makes it easy to fix any issues throughout the network.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the log files and system metrics.
- Filebeat watches and forwards log data.
- Metricbeat records metric data periodically.

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name     | Function |Private IP Address |Public IP Address| Operating System |
|----------|----------|------------|------------------|------------------|
|Jump Box Provisioner| Gateway  | 10.0.1.4   |    52.186.142.93      | Ubuntu LTS 18.04 |
|Web-1|Application Server|  10.0.1.5  |    20.85.212.13      |   Ubuntu LTS 18.04  |
|Web-2|Application Server|  10.0.1.6  |    20.85.212.13      |  Ubuntu LTS 18.04  |
|ELK-Stack|ELK Stack| 10.1.0.4 |   23.101.195.170     |   Ubuntu LTS 18.04   |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box Provisioner and ELK Stack machines can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- My Home IP Address

Machines within the network can only be accessed by the Jump Box Provisioner.
- The only machine that is allowed to acces the ELK-VM is the Jump Box Provisioner. It's IP Adress is 52.186.142.93

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
|Jump Box Provisioner|Yes| My Home IP Address |
|ELK-Stack|Yes| My Home IP Address  |
|Web-1| No | 10.0.1.4 |
|Web-2| No | 10.0.1.4 |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because it allows quick and consistent configuration. This makes the ELK stack quick to be created and configured.

The playbook implements the following tasks:
- Configure the maximum mapped memory with the sysctl module
- Install docker.io and python3-pip packages with the apt module
- Install docker python package with pip
- Enable systemd docker service
- Run ELK docker container

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![](https://github.com/Jacob4681/Project-1-ELK-Stack/blob/main/Dockerps.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web-1: 10.0.0.5
- Web-2: 10.0.0.6

We have installed the following Beats on these machines:
- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:
- Filebeat centralizes and forwards system logs from the Web VMs to the ELK Stack.
- Metricbeat records metric data of the Web VMs to the ELK VM.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the ELKplaybook.yml file to /etc/ansible/roles.
- Update the /etc/ansible/hosts file to include the ELK stack VM IP Address
- Run the playbook, and navigate to http://23.101.195.170:5601/app/kibana to check that the installation worked as expected.

### Using Filebeat and Metricbeat

### Filebeat
- Edit /etc/ansible/roles/filebeat-config.yml in the ansible container to include the ELK Stack IP

![](https://github.com/Jacob4681/Project-1-ELK-Stack/blob/main/Filebeat%20ElasticSearch%20Output.png)
![](https://github.com/Jacob4681/Project-1-ELK-Stack/blob/main/Filebeat%20Setup%20Kibana.png)

- After editing the filebeat configurations file, run the playbook using this command
  - $ ansible-playbook /etc/ansible/roles/Filebeat-playbook.yml

### Metricbeat
- Edit /etc/ansible/roles/metricbeat-config.yml in the ansible container to include the ELK Stack IP

![](https://github.com/Jacob4681/Project-1-ELK-Stack/blob/main/Metricbeat%20Elasticsearch%20Output.png)
![](https://github.com/Jacob4681/Project-1-ELK-Stack/blob/main/Metricbeat%20Setup%20Kibana.png)

- After editing the metricbeat configurations file, run the playbook using this command
  - $ ansible-playbook /etc/ansible/roles/Metricbeat-playbook.yml
