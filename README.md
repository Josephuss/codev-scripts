# codev-scripts

● Using any configuration management tool (Puppet, Chef, Salt, Ansible, etc.), write a server
configuration that would ensure a web server is installed (Apache or NGINX) , a vhost
configuration file is placed, the web server is set to start at boot, and is set to always be
running.
1. BONUS: Make script portable so that it can reproduce your results in my own Linux
docker container

● Using Terraform or CloudFormation, create a configuration that would
1. Create a VPC and a Subnet
2. Create an EC2 instance inside the subnet previously created
1. Assign a public IP
2. Give the server 100 GB storage space 
3. Create a security group allowing public access to port 443 and attach it to the EC2
4. BONUS: Write this module in such way that we can run your submission and
successfully build the environment in AWS

● Using BASH or Python, create a script that checks if the current day of the month is an odd
number, and if it is, reboot an EC2 instance and then publish a message to an SNS topic
stating whether it was successful or not. Assume the following:
1. The instance ID is I-123456789
2. The SNS topic is Devops-Alerts
3. BONUS: Allow us to specify an EC2 Instance ID and a SNS topic so that we can verify
your code in AWS