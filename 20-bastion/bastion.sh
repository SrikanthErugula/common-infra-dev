#!/bin/bash  

#sess-43
# growing or increase the /home volume or storage for terraform purpose
growpart /dev/nvme0n1 4
lvextend -L +30G /dev/mapper/RootVG-homeVol
xfs_growfs /home

# for sess -41 
sudo yum install -y yum-utils
# sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo 
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum install terraform


# sudo lvreduce -r -L 6G /dev/mapper/RootVG-rootVol

#sess-46
creating databases
cd /home/ec2-user
git clone https://github.com/daws-86s/roboshop-dev-infra.git
chown ec2-user:ec2-user -R common-infra-dev
cd roboshop-dev-infra/40-databases
terraform init
terraform apply -auto-approve