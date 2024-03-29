FROM quay.io/openshifthomeroom/workshop-dashboard:5.0.1

USER root

COPY . /tmp/src
RUN cp /tmp/src/dashboard/gateway/views/dashboard.pug /opt/workshop/gateway/views/

RUN rm -rf /tmp/src/.git* && \
    chown -R 1001 /tmp/src && \
    chgrp -R 0 /tmp/src && \
    chmod -R g+w /tmp/src

USER 1001

RUN /usr/libexec/s2i/assemble
