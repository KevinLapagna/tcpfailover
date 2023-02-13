FROM registry.access.redhat.com/ubi9/ubi-minimal:latest
LABEL maintainer="Kevin Lapagna <klapagna@redhat.com>"
LABEL io.k8s.description Simple HAProxy container for TCP service failover

RUN INSTALL_PKGS="haproxy-2.*" && \
    microdnf install -y --disableplugin=subscription-manager $INSTALL_PKGS && \
    microdnf clean all --disableplugin=subscription-manager

ENTRYPOINT [ "/usr/sbin/haproxy" ]
CMD [ "-f", "/etc/config/haproxy.cfg" ]