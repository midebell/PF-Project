# People-Fluent


Tasks


Required


Our clients based in the US have complained about the speed of page loads, so we'd like to set up identical infrastructure based closer to them. Please modify the config here to make that possible and to allow us to repeat that process in the future for other locations. Please note that in this scenario there is no need for storage across the regions.

Add a Dockerfile to ensure that the Terraform version running this configuration stays consistent.
We'd like to ensure that our SSH access to the machine is as secure as possible. Please add config for a bastion server and amend the config for our instance so it is not accessible over the internet.

Bonus round

Add a script in a language of your choice to automate running Terraform for a new DC, injecting variables as appropriate.
The application is not very scalable nor is it redundant in it's current form. Please add configuration to launch it into an auto-scaling group. The output should still return one endpoint which should show the nginx default landing page.
Add Cloudformation config to set up an s3 bucket for future remote state configuration.

Solution