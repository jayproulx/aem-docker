FROM aem:base
MAINTAINER "Jay Proulx <jay@proulx.info>"

# make some space to create the web.xml that we'll insert into the AEM WAR
RUN mkdir -p /usr/local/tomcat/~/WEB-INF/
ADD web.xml /usr/local/tomcat/~/WEB-INF/

RUN mkdir /usr/local/tomcat/webapps/ROOT
RUN cd /usr/local/tomcat/webapps/ROOT
RUN jar -xf /usr/local/tomcat/webapps/ROOT.war

# insert the customized web.xml into the AEM WAR
RUN cp /usr/local/tomcat/~WEB-INF/web.xml /usr/local/tomcat/webapps/ROOT/WEB-INF/web.xml
