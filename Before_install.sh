BeforeInstall:
    - location: ./install_dependencies.sh
      timeout: 300
      runas: root
    - location: ./install_tomcat.sh
      timeout: 300
      runas: root