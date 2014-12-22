FROM phusion/baseimage:0.9.15
MAINTAINER Dmitri Sh <smalllark@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# Set locale to UTF-8.
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
RUN echo LANG=\"en_US.UTF-8\" > /etc/default/locale

# Install Java.
RUN \
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
add-apt-repository -y ppa:webupd8team/java && \
apt-get update && \
apt-get install -y oracle-java8-installer && \
rm -rf /var/lib/apt/lists/* && \
rm -rf /var/cache/oracle-jdk8-installer

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# Define default command.
CMD ["bash"]
