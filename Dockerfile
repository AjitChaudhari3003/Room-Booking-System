FROM tomcat:9.0
COPY RoomBooking.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
