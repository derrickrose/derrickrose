FROM ubuntu:latest

RUN apt-get update
RUN apt-get install openjdk-8-jdk -y
RUN apt-get install maven -y

WORKDIR /home/app/slabcode-assessment/
COPY slabcode-assessment /home/app/slabcode-assessment/

RUN mvn install
CMD ["java", "-jar", "target/assessment-1.0.0-SNAPSHOT.jar"]
EXPOSE 8080
