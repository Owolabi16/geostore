#!/bin/bash

# Stop Tomcat or other application servers
sudo systemctl stop tomcat

# Check if Tomcat stopped successfully
if ! sudo systemctl is-active --quiet tomcat; then
  echo "Tomcat stopped successfully."
else
  echo "Failed to stop Tomcat."
  exit 1
fi

#!/bin/bash

# Navigate to the deployment archive directory
cd /opt/codedeploy-agent/deployment-root/*/d-*/deployment-archive

# Unzip the deployment.zip file
unzip deployment.zip -d /opt/codedeploy-agent/deployment-root/*/d-*/deployment-archive

# Verify the contents of the unzipped directory
ls -l /opt/codedeploy-agent/deployment-root/*/d-*/deployment-archive
echo "new build"