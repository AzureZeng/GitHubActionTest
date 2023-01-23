FROM rockylinux:9
WORKDIR /app
COPY run.sh .
ENTRYPOINT [ "./run.sh" ]