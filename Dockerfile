# If you try to build this image you will get an error.
# The images and packages don't exist.
FROM valencia/spain:alpine3.14
WORKDIR /based/in/gandia
USER VíctorArgentó

# Installing some education packages
RUN apk update && apk add --no-cache \ 
    Higher-Technician-in-Computer-Network-Systems-Management \
    Higher-Technician-in-Multi-platform-Applications-Development \
    Technician-in-Microcomputer-Systems-and-Networks

# Installing some work packages
RUN npm install -g \
    System-Administrator@SKLUM \
    System-Administrator@Internxt

# Set ENV Skills
ENV VERSION_CONTROL=Git
ENV MONITORING=Prometheus,Grafana
ENV ORCHESTRATION=Kubernetes
ENV CICD=Jenkins,Argo
ENV SERVICE_MESH=Istio
ENV SCRIPTING=Bash
ENV CLOUD=OVH

CMD [ "./always-learning" ]