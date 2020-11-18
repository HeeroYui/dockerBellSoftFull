FROM archlinux:latest

# update system
RUN pacman -Syu --noconfirm && pacman-db-upgrade
#install jdk-openjdk java-openjfx
####RUN pacman -S --noconfirm jdk-openjdk java-openjfx
RUN pacman -S --noconfirm tree libxext libxrender libxtst xorg
# clean all the caches
RUN pacman -Scc --noconfirm

RUN mkdir -p /usr/local/java/
RUN wget https://download.bell-sw.com/java/15.0.1+9/bellsoft-jdk15.0.1+9-linux-amd64-full.tar.gz
RUN tar xzvf bellsoft-jdk15.0.1+9-linux-amd64-full.tar.gz /usr/local/java/
RUN tree /usr/local/java/
RUN mv jdk-15.0.1-full/* /usr/local/java/jdk-15/

ENV JAVA_HOME=/usr/local/java/jdk-15
ENV JAVAFX_HOME=/usr/local/java/jdk-15
ENV PATH=/usr/local/java/jdk-15/bin/:$PATH
ENV LANG=C.UTF-8

RUN mkdir /application
WORKDIR /application

