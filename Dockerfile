FROM openjdk:8-jdk

RUN apt-get update
RUN apt-get install maven -y

COPY . /app
WORKDIR /app

# Database Persistence
VOLUME /app/data

RUN mkdir logs
RUN touch logs/tracker-server.log

RUN mvn package

EXPOSE 8082
EXPOSE 5055

CMD ["java", "-jar", "target/tracker-server.jar", "conf/traccar.xml"]
