#!/bin/bash

# Navigate to the deployment archive directory
cd /opt/codedeploy-agent/deployment-root/$(ls /opt/codedeploy-agent/deployment-root)/d-*/deployment-archive

# Unzip the deployment.zip file
unzip deployment.zip -d /opt/codedeploy-agent/deployment-root/$(ls /opt/codedeploy-agent/deployment-root)/d-*/deployment-archive

# Verify the contents of the unzipped directory
ls -l /opt/codedeploy-agent/deployment-root/$(ls /opt/codedeploy-agent/deployment-root)/d-*/deployment-archive
