#!/bin/bash
sudo apt-get update -y
sudo apt-get install -y tomcat9
sudo systemctl start tomcat9
sudo systemctl enable tomcat9