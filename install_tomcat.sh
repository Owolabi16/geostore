#!/bin/bash

# Install Tomcat
sudo apt install -y tomcat
sudo systemctl start tomcat
sudo systemctl enable tomcat