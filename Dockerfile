FROM ubuntu:trusty
MAINTAINER GUTO

RUN sed -i "s/http:\/\/archive./http:\/\/th.archive./g" /etc/apt/sources.list

RUN apt-get update && \
    apt-get install -qy software-properties-common && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update -qy && \
    apt-get install -qy ansible
VOLUME /ansible
WORKDIR /ansible
ADD ansible/site.yml /ansible/site.yml
ENTRYPOINT ["ansible-playbook"]
CMD ["site.yml"]
