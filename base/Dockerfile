FROM tomcat:8-jre8
MAINTAINER "Jay Proulx <jay@proulx.info>"

# Get Oracle JDK, required for production support of AEM
# https://www.digitalocean.com/community/tutorials/how-to-manually-install-oracle-java-on-a-debian-or-ubuntu-vps
RUN wget --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u111-b14/jdk-8u111-linux-x64.tar.gz
RUN mkdir /opt/jdk
RUN tar -zxf jdk-8u111-linux-x64.tar.gz -C /opt/jdk
RUN update-alternatives --install /usr/bin/java java /opt/jdk/jdk1.8.0_111/bin/java 2000
RUN update-alternatives --install /usr/bin/javac javac /opt/jdk/jdk1.8.0_111/bin/javac 2000
RUN update-alternatives --install /usr/bin/jar jar /opt/jdk/jdk1.8.0_111/bin/jar 2000

ENV JAVA_OPTS=-Xmx2G

ADD tomcat-users.xml /usr/local/tomcat/conf/

# This context.xml has a <Resource> required for AEM to bootstrap properly
ADD context.xml /usr/local/tomcat/conf/

# --- INSTALL AEM WAR ---
# First remove original ROOT webapp
RUN rm -rf /usr/local/tomcat/webapps/ROOT*
ADD AEM_6.2_Quickstart.war /usr/local/tomcat/webapps/ROOT.war
ADD license.properties /usr/local/tomcat/

# make some space to create the web.xml that we'll insert into the AEM WAR
RUN mkdir -p /usr/local/tomcat/~/WEB-INF/
ADD author-web.xml /usr/local/tomcat/~/WEB-INF/
RUN mv /usr/local/tomcat/~/WEB-INF/author-web.xml /usr/local/tomcat/~/WEB-INF/web.xml

# insert the customized web.xml into the AEM WAR
RUN jar -uf /usr/local/tomcat/webapps/ROOT.war -C /usr/local/tomcat/~ WEB-INF/web.xml