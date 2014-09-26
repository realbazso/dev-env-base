#!/bin/bash

        mkdir -p /home/dev/.ssh
        chown -R 2111:2111 /home/dev
        groupadd admin
        useradd -d /home/dev -u 1111 -G admin -s /bin/bash dev
        if [ -f //home/dev/.ssh/dev.key ]; then echo "key ok"; 
                else ssh-keygen -q -f /home/dev/.ssh/dev.key -P "";  
                cat /home/dev/.ssh/dev.key.pub >> /home/dev/.ssh/authorized_keys; 
	fi
        chown -R 1111:1111 /home/dev
        chmod 700 /home/dev/.ssh
        chmod 600 /home/dev/.ssh/authorized_keys

service ssh start
