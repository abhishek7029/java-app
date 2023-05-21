FROM maven:3.8.5-openjdk-8-slim AS build
ENV APP_HOME=/app
WORKDIR /app
COPY . .
RUN mvn clean package
RUN cp target/*.war target/springapp.war
CMD [ "java", "-jar", "-Dspring.profiles.active=mysql", "target/springapp.war" ]
EXPOSE 8090
EXPOSE 8091

