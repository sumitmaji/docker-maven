FROM sumit/jdk1.8:latest
MAINTAINER Sumit Kumar Maji

WORKDIR /usr/local
ARG REPOSITORY_HOST
RUN wget "$REPOSITORY_HOST"/repository/files/apache-maven-3.3.9-bin.tar.gz &&\
tar -xzvf /usr/local/apache-maven-3.3.9-bin.tar.gz &&\
mv /usr/local/apache-maven-3.3.9 /usr/local/maven &&\
rm -rf /usr/local/apache-maven-3.3.9-bin.tar.gz

RUN mv /usr/local/maven/conf/settings.xml /usr/local/maven/conf/settings.xml_bk
COPY settings.xml /usr/local/maven/conf/

#Maven Environemtn Setup
ENV MVN_HOME /usr/local/maven
ENV PATH $PATH:$MVN_HOME/bin
ENV MAVEN_OPTS -Xms256m -Xmx512m

#RUN su - hduser -c "echo 'export JAVA_HOME=/usr/local/jdk' >> /home/hduser/.bashrc"
#RUN su - hduser -c "echo 'export PATH=$PATH:$JAVA_HOME/bin' >> /home/hduser/.bashrc"
#RUN echo 'export MVN_HOME=/usr/local/maven' >> /home/hduser/.bashrc
#RUN echo 'export PATH=$PATH:$MVN_HOME/bin' >> /home/hduser/.bashrc
#RUN echo 'export MAVEN_OPTS=-Xms256m -Xmx512m' >> /home/hduser/.bashrc

RUN java -version
RUN mvn -version

