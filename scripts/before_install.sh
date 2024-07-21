#!/bin/bash

# Navigate to the deployment archive directory
cd /opt/codedeploy-agent/deployment-root/*/d-*/deployment-archive

# Unzip the deployment.zip file
unzip deployment.zip -d /opt/codedeploy-agent/deployment-root/*/d-*/deployment-archive

# Verify the contents of the unzipped directory
ls -l /opt/codedeploy-agent/deployment-root/*/d-*/deployment-archive

#!/bin/bash

# # Find the latest deployment directory
# DEPLOYMENT_DIR=$(find /opt/codedeploy-agent/deployment-root -mindepth 2 -maxdepth 2 -type d | sort | tail -n 1)

# # Unzip the deployment.zip file
# unzip $DEPLOYMENT_DIR/deployment.zip -d $DEPLOYMENT_DIR

# # Verify the contents of the unzipped directory
# ls -l $DEPLOYMENT_DIR

