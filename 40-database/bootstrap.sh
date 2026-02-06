#!/bin/bash

# dnf install ansible -y
# ansible-pull -U https://github.com/SrikanthErugula/ansible-robo-roles.tf.git -e component=$component main.yaml 

# the above is HARDCODE chesam but we are using same code for all db then we need do below setup 

#sess-40
component=$1    # here manam name adhi iste adhi vastundhi like redis or mysql ... this shell script
environment=$2
dnf install ansible -y
#ansible-pull -U https://github.com/SrikanthErugula/ansible-robo-roles.tf.git -e component=$component main.yaml 
#git clone ansible-playbook
# cd ansible-playbook
# ansible-playbook -i inventory main.yaml

#---> the above ansible pull antha ga work or .ini ni repect cheyatum ledhu so we need to set below points

#sess-41
REPO_URL=https://github.com/SrikanthErugula/ansible-robo-roles.tf.git
REPO_DIR=/opt/roboshop/ansible        # /opt means optional 
ANSIBLE_DIR=ansible-robo-roles.tf

mkdir -p $REPO_DIR
mkdir -p /var/log/roboshoplogs/
touch ansible.log

cd $REPO_DIR
# check if ansible repo is already cloned or not

if [ -d $ANSIBLE_DIR ]; then #-d means DIR

    cd $ANSIBLE_DIR
    git pull
else
    git clone $REPO_URL
    cd $ANSIBLE_DIR
fi

# so here ansible-robo-roles.tf idhe file vunna now we below cmd
ansible-playbook -e component=$component -e env=$environment main.yaml

# no need to give .ini bcz we had been given in ansible.cfg lo 