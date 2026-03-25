## Apache Tomcat Installation And Setup In AWS EC2 Redhat Instance.
 ##### Prerequisite
+ AWS Acccount.
+ Create Redhat EC2 T2.micro Instance.
+ Create Security Group and open  
+ Tomcat ports or Required ports.
    + 8080 ..etc
+ Attach Security Group to EC2 Instance.
+ Install java openJDK 1.8+
+ Install Java JDK 1.8+ 


### change hostname to tomcat and change to EST Time-zone

```sh 
sudo timedatectl set-timezone Africa/Douala
sudo hostnamectl set-hostname tomcat
sudo su - ec2-user
cd /opt 
``` 

## install Java JDK 1.8+ as a pre-requisit for tomcat to run.

```sh
sudo yum install git wget -y
sudo yum install java-21-openjdk-devel -y
``` 

## install wget unzip packages.

```sh 
sudo yum install wget unzip -y
Install Tomcat version 9.0.113
Download and extract the tomcat server
sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.113/bin/apache-tomcat-9.0.113.zip
sudo unzip apache-tomcat-9.0.113.zip
sudo rm -rf apache-tomcat-9.0.113.zip
sudo mv apache-tomcat-9.0.113 tomcat9 #rename tomcat for good naming convention
```

### assign executable permissions to the tomcat home directory

```sh
sudo chmod 777 -R /opt/tomcat9
sudo chown ec2-user -R /opt/tomcat9
```

### start tomcat

```sh
sh /opt/tomcat9/bin/startup.sh
```

# create a soft link to start and stop tomcat
# This will enable us to manage tomcat as a service

```sh 
sudo ln -s /opt/tomcat9/bin/startup.sh /usr/bin/starttomcat
sudo ln -s /opt/tomcat9/bin/shutdown.sh /usr/bin/stoptomcat
starttomcat
sudo su - ec2-user
```