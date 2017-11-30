FROM centos

RUN yum -y install openssl openssl-devel
RUN yum -y install pcre-devel
RUN yum install -y zlib-devel
RUN yum -y install gcc-c++
RUN yum -y install wget

WORKDIR /root

RUN wget http://nginx.org/download/nginx-1.13.7.tar.gz
RUN tar -xvf nginx-1.13.7.tar.gz

RUN ./configure
RUN make && make install

COPY nginx.conf /usr/local/nginx/conf

RUN ln -s /usr/local/nginx/sbin/nginx /usr/local/bin

EXPOSE 8080

CMD ["nginx"]


