FROM perl:5.42.0

WORKDIR /home

RUN sed -i 's|deb.debian.org|mirrors.aliyun.com|g' /etc/apt/sources.list.d/debian.sources \
    && apt update

RUN curl -o /usr/bin/pt-archiver "https://raw.githubusercontent.com/Veitor/pt-archiver-fix/refs/heads/main/pt-archiver.fix" \
    && chmod +x /usr/bin/pt-archiver

ENV DEBIAN_FRONTEND=noninteractive
RUN cd /usr/src && wget https://dev.mysql.com/get/mysql-apt-config_0.8.34-1_all.deb \
    && apt install lsb-release \
    # 原本是交互式命令，这里改成预配置
    && echo "mysql-apt-config mysql-apt-config/select-server select " | debconf-set-selections \
    && echo "mysql-apt-config mysql-apt-config/select-product select Ok" | debconf-set-selections \
    && echo "mysql-apt-config mysql-apt-config/select-connectors select Enabled" | debconf-set-selections \
    && echo "mysql-apt-config mysql-apt-config/repo-url string http://repo.mysql.com/apt" | debconf-set-selections \
    && echo "mysql-apt-config mysql-apt-config/unsupported-platform select debian bookworm" | debconf-set-selections \
    && echo "mysql-apt-config mysql-apt-config/repo-distro select debian" | debconf-set-selections \
    && echo "mysql-apt-config mysql-apt-config/repo-codename select bookworm" | debconf-set-selections \
    && echo "mysql-apt-config mysql-apt-config/connectors-component string mysql-tools" | debconf-set-selections \
    && dpkg -i mysql-apt-config_0.8.34-1_all.deb \
    && rm -f mysql-apt-config_0.8.34-1_all.deb

RUN apt update
RUN apt install -y libmysqlclient-dev
RUN cpanm DBD::mysql


ENTRYPOINT ["/usr/bin/pt-archiver"]