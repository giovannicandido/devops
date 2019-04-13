FROM fedora
ENV HELM_VERSION v2.13.1
COPY kubernetes.repo /etc/yum.repos.d/kubernetes.repo
RUN dnf install -y ansible kubectl jq && \
    dnf clean all
RUN curl -o helm.tar.gz https://storage.googleapis.com/kubernetes-helm/helm-${HELM_VERSION}-linux-amd64.tar.gz  && \
    tar zxvf helm.tar.gz && \
    mv linux-amd64/helm /usr/local/bin && \
    mv linux-amd64/tiller /usr/local/bin && \
    rm -rf linux-amd64 helm.tar.gz