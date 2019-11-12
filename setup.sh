echo '安装Java'
tar vxf jdk-8u171-linux-x64.tar.gz
mv ./jdk1.8.0_171 /usr/lib/jdk1.8.0_171
echo 'export JAVA_HOME=/usr/lib/jdk1.8.0_171'>>/etc/profile
echo 'export CLASSPATH=.:$JAVA_HOME/lib:$JAVA_HOME/jre/lib:$CLASSPATH'>>/etc/profile
echo 'export PATH=$JAVA_HOME/bin:$JAVA_HOME/jre/bin:$PATH'>>/etc/profile

echo '安装Maven'
tar vxf apache-maven-3.5.3-bin.tar.gz
mv ./apache-maven-3.5.3 /usr/local/maven
echo 'export MAVEN_HOME=/usr/local/maven'>>/etc/profile
echo 'export PATH=${PATH}:${MAVEN_HOME}/bin'>>/etc/profile

echo '安装Gradle'
wget https://downloads.gradle.org/distributions/gradle-4.9-bin.zip
mkdir /opt/gradle
# 安装unzip，ubuntu
apt-get install unzip
# centos:yum install zip unzip
unzip -d /opt/gradle gradle-4.9-bin.zip
echo 'export PATH=$PATH:/opt/gradle/gradle-4.9/bin'>>/etc/profile

echo '安装docker'  
#CentOS安装命令 
#sudo yum update
#sudo yum install docker
#Ubuntu安装命令
#sudo apt-get update
#sudo apt-get  install -y  docker.io

echo '安装docker-compose'
mv ./docker-compose /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

source /etc/profile

echo '测试安装是否成功'
java -version
mvn -version
gradle -version
docker --version
docker-compose -version