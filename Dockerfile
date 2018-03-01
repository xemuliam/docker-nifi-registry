FROM       alpine
MAINTAINER Viacheslav Kalashnikov <xemuliam@gmail.com>
ARG        DIST_MIRROR=http://archive.apache.org/dist/nifi/nifi-registry
ARG        VERSION=0.1.0
ENV        NIFI_REGISTRY_HOME=/opt/nifi-registry \
           JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk \
           PATH=$PATH:/usr/lib/jvm/java-1.8-openjdk/jre/bin:/usr/lib/jvm/java-1.8-openjdk/bin
RUN        apk add --no-cache bash curl openjdk8 && \
           mkdir -p ${NIFI_REGISTRY_HOME} && \
           curl ${DIST_MIRROR}/nifi-registry-${VERSION}/nifi-registry-${VERSION}-bin.tar.gz | tar xvz -C ${NIFI_REGISTRY_HOME} && \
           mv ${NIFI_REGISTRY_HOME}/nifi-registry-${VERSION}/* ${NIFI_REGISTRY_HOME} && \
           rm -rf ${NIFI_HOME}/nifi-registry-${VERSION} && \
           rm -rf *.tar.gz
EXPOSE     8080 8443
WORKDIR    ${NIFI_REGISTRY_HOME}
CMD        ./bin/nifi.sh run
