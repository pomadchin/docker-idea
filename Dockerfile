## Inspired by https://github.com/fgrehm/docker-eclipse

FROM ubuntu:14.04
MAINTAINER Grigory Pomadchin daunnc@gmail.com 

RUN sed 's/main$/main universe/' -i /etc/apt/sources.list && \
    apt-get update && apt-get install -y software-properties-common && \
    add-apt-repository ppa:webupd8team/java -y && \
    apt-get update && \
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    apt-get install -y oracle-java8-installer libxext-dev libxrender-dev libxtst-dev git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

RUN apt-get update && apt-get install -y libgtk2.0-0 libcanberra-gtk-module

RUN wget http://download-cf.jetbrains.com/idea/ideaIC-2016.2.4.tar.gz -O /tmp/idea.tar.gz -q && \
    mkdir -p /opt/idea && \
    tar -xf /tmp/idea.tar.gz --strip-components=1 -C /opt/idea && \
    rm -rf /tmp/idea.tar.gz

RUN mkdir -p /home/developer && \
    mkdir /home/developer/.IntelliJIdea2016.2 && \
    echo "developer:x:1000:1000:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:1000:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown developer:developer -R /home/developer && \
    chown root:root /usr/bin/sudo && chmod 4755 /usr/bin/sudo

RUN sudo chown developer:developer /home/developer/.IntelliJIdea2016.2
USER developer
ENV HOME /home/developer
WORKDIR /home/developer
CMD /opt/idea/bin/idea.sh
