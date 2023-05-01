# openjdk11을 베이스로 이미지를 만든다.
FROM openjdk:11-jdk-slim

# Selenium 사용 위해 Chrome 및 Chrome WebDriver 설치
RUN apt-get update && \
    apt-get install -y wget unzip xvfb libxi6 libgconf-2-4 default-jdk libgbm-dev && \
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    dpkg -i google-chrome-stable_current_amd64.deb && \
    wget https://chromedriver.storage.googleapis.com/112.0.5615.49/chromedriver_linux64.zip && \
    unzip chromedriver_linux64.zip && \
    mv chromedriver /usr/bin/chromedriver && \
    chmod +x /usr/bin/chromedriver

# JAR_FILE 변수에 jar 파일을 등록
ARG JAR_FILE=/build/libs/JenkinsTest-0.0.1-SNAPSHOT.jar

# build 된 jar 파일을 container 내부에 복사
# 젠킨스 도커 -> 스프링 도커
COPY ${JAR_FILE} ./app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]

# Spring 프로파일 적용할 때
# ENTRYPOINT ["sh", "-c", "java ${JAVA_OPTS} -jar /app.jar"]
