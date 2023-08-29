FROM tomcat:9.0.64-jre11-temurin-focal

# ==== dumb-init ====
RUN apt-get update && \
  apt-get install -y dumb-init && \
  apt-get install -y vim && \
  apt-get clean

# ==== environment ====
RUN rm -rf /usr/local/tomcat/webapps/ROOT \
  && update-ca-certificates -f

# ==== add Knowledge ====
# ADD https://github.com/support-project/knowledge/releases/download/v1.13.1/knowledge.war \
#   /usr/local/tomcat/webapps/knowledge.war

# copy knowledge.war from dist folder
COPY ./dist/knowledge.war /usr/local/tomcat/webapps/

RUN mkdir /home/knowledge

VOLUME [ "/root/.knowledge" ]
EXPOSE 8080

ENV JPDA_ADDRESS="0.0.0.0:8000"
ENV JPDA_TRANSPORT="dt_socket"
EXPOSE 8000

CMD [ "dumb-init", "/usr/local/tomcat/bin/catalina.sh", "jpda", "run" ]
