FROM azul/zulu-openjdk:latest
MAINTAINER qq.zhu "yaoye529@gmail.com"
# RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo "Asia/Shanghai" > /etc/timezone
RUN apt-get update && apt-get install -y --no-install-recommends wget curl net-tools iputils-ping traceroute lsof
VOLUME /tmp
COPY eureka.jar /app.jar
RUN bash -c 'touch /app.jar'

EXPOSE 7500
ENTRYPOINT ["java","-Djava.net.preferIPv4Stack=true -Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
