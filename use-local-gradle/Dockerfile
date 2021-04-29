FROM adoptopenjdk:8-jdk-hotspot as BUILDER

# install git
RUN apt update && \
    apt upgrade -y && \
    apt install -y git

COPY ForgeGradle /ForgeGradle
COPY ./use-local-gradle/useLocal.gradle /ForgeGradle/

WORKDIR /ForgeGradle
RUN ./gradlew --init-script=useLocal.gradle publishToMavenLocal

FROM adoptopenjdk:8-jdk-hotspot

# install git
RUN apt update && \
    apt upgrade -y && \
    apt install -y git

# download 
RUN git clone https://github.com/anatawa12/ForgeGradle-example --depth=1

COPY run.sh .
RUN chmod +x run.sh

WORKDIR /ForgeGradle-example

ARG SETUP_TASK
ENV SETUP_TASK ${SETUP_TASK}

COPY ./use-local-gradle/useLocal.gradle /ForgeGradle-example/
COPY --from=BUILDER /root/.m2/ /root/.m2/

CMD ["/run.sh"]
