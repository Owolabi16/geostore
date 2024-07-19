#!/bin/bash

# Install Tomcat
TOMCAT_VERSION=9.0.56
cd /opt
wget https://downloads.apache.org/tomcat/tomcat-9/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz
tar -xzvf apache-tomcat-$TOMCAT_VERSION.tar.gz
ln -s apache-tomcat-$TOMCAT_VERSION tomcat
chown -R ec2-user:ec2-user /opt/apache-tomcat-$TOMCAT_VERSION
sudo systemctl start tomcat
sudo systemctl enable tomcat