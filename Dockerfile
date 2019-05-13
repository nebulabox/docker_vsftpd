FROM ubuntu:latest

LABEL Description="vsftpd Docker image based on Ubuntu LTS latest." \
	Usage="docker run -d -p [HOST PORT NUMBER]:21 nebulabox/vsftpd" \
	Version="1.0"

RUN sed -i 's/archive.ubuntu.com/mirrors.163.com/g' /etc/apt/sources.list
RUN sed -i 's/^[^#].*security.ubuntu.com/#&/g' /etc/apt/sources.list
# RUN cat /etc/apt/sources.list
RUN apt update -y && apt upgrade -y
RUN apt install vsftpd -y 

RUN useradd -m test
# RUN echo -e "test\ntest" | passwd test

COPY vsftpd.conf /etc/vsftpd/
COPY run-vsftpd.sh /usr/sbin/

RUN chmod +x /usr/sbin/run-vsftpd.sh

EXPOSE 20 21

CMD ["/usr/sbin/run-vsftpd.sh"]




