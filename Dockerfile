FROM archlinux:latest

# update system
RUN pacman -Syu --noconfirm && \
    pacman-db-upgrade && \
    pacman -S --noconfirm libxext libxrender libxtst xorg wget && \
    pacman -Scc --noconfirm

ENV JAVA_HOME=/usr/local/java/jdk-15
ENV JAVAFX_HOME=/usr/local/java/jdk-15
ENV PATH=/usr/local/java/jdk-15/bin/:$PATH
ENV LANG=C.UTF-8

RUN mkdir -p /usr/local/java/ && \
    wget https://download.bell-sw.com/java/15.0.1+9/bellsoft-jdk15.0.1+9-linux-amd64-full.tar.gz && \
    tar xzvf bellsoft-jdk15.0.1+9-linux-amd64-full.tar.gz && \
    mv jdk-15.0.1-full /usr/local/java/jdk-15

RUN mkdir /application
WORKDIR /application
