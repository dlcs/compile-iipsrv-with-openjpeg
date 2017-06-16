FROM centos

RUN yum update -y && yum install -y epel-release scl-utils scl-utils-build memcached libjpeg-devel libtiff-devel centos-release-scl git cmake zlib-devel libpng-devel lcms2-devel wget

RUN yum install -y devtoolset-4

RUN scl enable devtoolset-4 bash

RUN mkdir -p /opt && cd /opt && git clone https://github.com/uclouvain/openjpeg.git

RUN yum groupinstall -y 'Development Tools'

RUN cd /opt/openjpeg && cmake -DCMAKE_BUILD_TYPE=Release _DCMAKE_INSTALL_PREFIX=/usr . && make && make install && ldconfig

RUN cp /usr/local/include/openjpeg-2.2/*.h /opt/openjpeg/src/lib/openjp2/
RUN cp /usr/local/lib/libopenjp2.so /opt/openjpeg/bin/.

RUN cd ~ && git clone https://github.com/ruven/iipsrv.git

RUN cd ~/iipsrv && ./autogen.sh && ./configure --with-openjpeg=/opt/openjpeg && make

RUN mkdir -p /opt/iipsrv && cp ~/iipsrv/src/iipsrv.fcgi /opt/iipsrv/.

COPY docker.sh /.

