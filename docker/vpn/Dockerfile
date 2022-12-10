FROM debian
RUN apt update
RUN apt install vim net-tools openvpn uml-utilities -y
ENTRYPOINT ["ls -la", "/etc/openvpn/server"]
