FROM registry.access.redhat.com/ubi9:9.1.0-1750
LABEL maintainer="Kevin Lapagna <klapagna@redhat.com>"
LABEL io.k8s.description Simple HAProxy container for TCP service failover

RUN INSTALL_PKGS="haproxy" && \
    dnf install -y --disableplugin=subscription-manager $INSTALL_PKGS && \
    yum clean all

ENTRYPOINT [ "/usr/sbin/haproxy" ]
CMD [ "-f", "/etc/config/haproxy.cfg" ]