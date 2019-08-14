#!/bin/bash

apt-get update
apt-get install default-jdk -y
mkdir -p /opt
cd /tmp
wget http://mirror.reverse.net/pub/apache/tomcat/tomcat-7/v7.0.96/bin/apache-tomcat-7.0.96.tar.gz
tar xvzf /tmp/apache-tomcat-7.0.96.tar.gz
mv /tmp/apache-tomcat-7.0.96 /opt/tomcat7
echo "export CATALINA_HOME=/opt/tomcat7" >> /root/.bashrc
. /root/.bashrc
/opt/tomcat7/bin/startup.sh
