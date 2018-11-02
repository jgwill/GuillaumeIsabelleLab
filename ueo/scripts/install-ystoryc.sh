#!/bin/bash
#@a Must be run as ROOT


# Installing /etc/scripts
#mkdir /m 777 /etc/scripts
svn co https://jgwill.com/svn/ps_repository/it.ueo/etc/scripts /etc/scripts
echo "@s Checked out the Scripting folder"
chmod a+x /etc/scripts/*.sh


# Creating /backups
mkdir -m 777 /backups


#@a Cheking out historic data
svn co https://jgwill.com/svn/ps_repository/it.ueo/historic /backups/historic
chmod 777 /backups/historic
echo "Checked out the Ystoryc working directory"


#@a Installing BASH alias and resource
source /etc/scripts/src/install-bash-logics.sh

#@a Display to user
echo "Ready"
echo "run alias lh  to run /etc/scripts/loghistoric.sh to log a Shell historic"
