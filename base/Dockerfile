FROM tomcat:8-jre8
MAINTAINER "Jay Proulx <jay@proulx.info>"

ENV JAVA_OPTS=-Xmx2G
ENV JDK_INSTALL_FOLDER /opt/jdk
ENV JAVA_VERSION jdk1.8.0_111
ENV JAVA_HOME ${JDK_INSTALL_FOLDER}/${JAVA_VERSION}
ENV ORACLE_VERSION 8u111-b14
ENV JAVA_FILE jdk-8u111-linux-x64.tar.gz
ENV TOMCAT_FOLDER /usr/local/tomcat

ADD license.properties ${TOMCAT_FOLDER}/
ADD AEM_6.2_Quickstart.war ${TOMCAT_FOLDER}/

# Add tomcat-users.xml customized based on AEM instructions
ADD tomcat-users.xml ${TOMCAT_FOLDER}/conf/

# This context.xml has a <Resource> required for AEM to bootstrap properly
ADD context.xml ${TOMCAT_FOLDER}/conf/

# First remove original ROOT webapp
RUN rm -rf ${TOMCAT_FOLDER}/webapps/ROOT*

# Get Oracle JDK, required for production support of AEM
# https://www.digitalocean.com/community/tutorials/how-to-manually-install-oracle-java-on-a-debian-or-ubuntu-vps
RUN wget --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/${ORACLE_VERSION}/${JAVA_FILE}
RUN mkdir ${JDK_INSTALL_FOLDER}
RUN tar -zxf ${JAVA_FILE} -C ${JDK_INSTALL_FOLDER}
RUN update-alternatives --install /usr/bin/java java ${JDK_INSTALL_FOLDER}/${JAVA_VERSION}/bin/java 2000
RUN update-alternatives --install /usr/bin/javac javac ${JDK_INSTALL_FOLDER}/${JAVA_VERSION}/bin/javac 2000
RUN update-alternatives --install /usr/bin/jar jar ${JDK_INSTALL_FOLDER}/${JAVA_VERSION}/bin/jar 2000

# --- INSTALL AEM WAR AND EXTRACT TO MAKE UPDATING web.xml EASIER ---
WORKDIR ${TOMCAT_FOLDER}/webapps/ROOT
RUN jar -xf ${TOMCAT_FOLDER}/AEM_6.2_Quickstart.war

WORKDIR ${TOMCAT_FOLDER}
