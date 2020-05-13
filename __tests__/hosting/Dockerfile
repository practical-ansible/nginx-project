FROM ubuntu:20.04

RUN apt-get update
RUN apt-get install -y openssh-server sudo
RUN mkdir /var/run/sshd
RUN echo 'root:test' | chpasswd
RUN useradd -m ansible
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

# Configure non-root user
RUN echo 'ansible:test' | chpasswd
RUN echo "ansible ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
EXPOSE 22/tcp 80/tcp 443/tcp
CMD ["/usr/sbin/sshd", "-D"]

