FROM tomcat:10.1.28-jdk17

# Eliminar apps por defecto
RUN rm -rf /usr/local/tomcat/webapps/*

# Copiar WAR
COPY dist/PetTravelDocs.war /usr/local/tomcat/webapps/ROOT.war

# Exponer puerto
EXPOSE 8080

# Iniciar Tomcat
CMD ["catalina.sh", "run"]
