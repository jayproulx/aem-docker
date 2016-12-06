# get war and license, docker doesn't like files outside the context root
cp AEM_6.2_Quickstart.war base
cp license.properties base
cd base
docker build -t aem:base .
# cleanup
rm AEM_6.2_Quickstart.war
rm license.properties
