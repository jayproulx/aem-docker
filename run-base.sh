mkdir -p author/crx-quickstart
docker run -it --rm --name aembase -v `pwd`/base/crx-quickstart:/usr/local/tomcat/crx-quickstart -p 8080:8080 aem:base
