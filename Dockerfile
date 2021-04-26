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

CMD ["/run.sh"]
