# PF - Project


# Tasks
# Required
1.	Our clients based in the US have complained about the speed of page loads, so we'd like to set up identical infrastructure based closer to them. Please modify the config here to make that possible and to allow us to repeat that process in the future for other locations. Please note that in this scenario there is no need for storage across the regions.
2.	Add a Dockerfile to ensure that the Terraform version running this configuration stays consistent.
3.	We'd like to ensure that our SSH access to the machine is as secure as possible. Please add config for a bastion server and amend the config for our instance so it is not accessible over the internet.
# Bonus round
1.	Add a script in a language of your choice to automate running Terraform for a new DC, injecting variables as appropriate.
2.	The application is not very scalable nor is it redundant in it's current form. Please add configuration to launch it into an auto-scaling group. The output should still return one endpoint which should show the nginx default landing page.
3.	Add Cloudformation config to set up an s3 bucket for future remote state configuration.

# Solution
# Required No 1:	
Folder named No_1 contains solution. Edit file terraform.tfvars with your AWS keys
a)	AWS_ACCESS_KEY = "YOUR KEY HERE"
b)	AWS_SECRET_KEY = "YOUR KEY HERE"
c)	Generate key pair by running:
	ssh-keygen -f pfkey
d)	Run terraform init
e)	Run terraform apply
# Required No 2:	
Folder named No_2 contains solution. 
a)	Please edit file terraform.tfvars with your AWS keys:
	AWS_ACCESS_KEY = "YOUR KEY HERE"
        AWS_SECRET_KEY = "YOUR KEY HERE"
b)	Generate key pair by running:
	ssh-keygen -f pfkey
c)	Run docker build
d)	Run docker plan init
e)	Run docker plan apply
# Required No 3:	
Folder named No_1 contains solution. Edit file terraform.tfvars with your AWS keys
a)	AWS_ACCESS_KEY = "YOUR KEY HERE"
b)	AWS_SECRET_KEY = "YOUR KEY HERE"
c)	Generate key pair by running:
	ssh-keygen -f pfkey
d)	Run terraform init
e)	Run terraform apply
# Bonus:	
1.	Run a job in Jenkins using Jenkinsfile to automate running Terraform.
2.	Auto-scaling was added with configuration. To run :
a)	Edit file terraform.tfvars with your AWS keys
b)	AWS_ACCESS_KEY = "YOUR KEY HERE"
c)	AWS_SECRET_KEY = "YOUR KEY HERE"
d)	Generate key pair by running:
	ssh-keygen -f pfkey
e)	Run terraform init
f)	Run terraform apply
3.	Cloudformation config was added to serve as backend. “S3_Bucket.template”
