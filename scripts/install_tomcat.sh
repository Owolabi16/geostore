# #!/bin/bash

# set -e

# # Variables
# TOMCAT_VERSION=9.0.56
# TOMCAT_DIR=/opt/tomcat
# TOMCAT_USER=tomcat

# # Update package list and install dependencies
# sudo apt update -y
# sudo apt install -y openjdk-8-jdk wget

# # Create Tomcat directory if it does not exist
# if [ ! -d "$TOMCAT_DIR" ]; then
#     sudo mkdir -p $TOMCAT_DIR
# else
#     echo "Directory $TOMCAT_DIR already exists"
# fi

# # Check if the Tomcat user already exists before creating it
# if id "$TOMCAT_USER" &>/dev/null; then
#     echo "User $TOMCAT_USER already exists"
# else
#     sudo useradd -m -U -d $TOMCAT_DIR -s /bin/false $TOMCAT_USER
# fi

# # Download and install Tomcat
# cd /tmp
# wget https://downloads.apache.org/tomcat/tomcat-9/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz
# sudo tar -xzf apache-tomcat-$TOMCAT_VERSION.tar.gz -C $TOMCAT_DIR --strip-components=1
# sudo chown -R $TOMCAT_USER:$TOMCAT_USER $TOMCAT_DIR

# Set up Tomcat as a systemd service
sudo bash -c 'cat << EOF > /etc/systemd/system/tomcat.service
[Unit]
Description=Apache Tomcat Web Application Container
After=network.target

[Service]
Type=forking

User=tomcat
Group=tomcat

Environment="JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre"
Environment="CATALINA_PID=/opt/tomcat/temp/tomcat.pid"
Environment="CATALINA_HOME=/opt/tomcat"
Environment="CATALINA_BASE=/opt/tomcat"
Environment="CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC"
Environment="JAVA_OPTS=-Djava.awt.headless=true -Djava.security.egd=file:/dev/./urandom"

ExecStart=/opt/tomcat/bin/startup.sh
ExecStop=/opt/tomcat/bin/shutdown.sh

Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF'

# Reload systemd daemon
sudo systemctl daemon-reload

# Start and enable Tomcat service
sudo systemctl start tomcat
sudo systemctl enable tomcat
