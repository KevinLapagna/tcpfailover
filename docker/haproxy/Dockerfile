FROM registry.access.redhat.com/ubi9:latest
LABEL maintainer="Kevin Lapagna <klapagna@redhat.com>"
LABEL io.k8s.description Simple HAProxy container for TCP service failover

RUN INSTALL_PKGS="haproxy-2.*" && \
    dnf install -y --disableplugin=subscription-manager $INSTALL_PKGS && \
    dnf clean all --disableplugin=subscription-manager

ENTRYPOINT [ "/usr/sbin/haproxy" ]
CMD [ "-f", "/etc/config/haproxy.cfg" ]