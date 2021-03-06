#===========================#
# multi-stage: build
#===========================#

FROM sjtuhpc/hpc-base-container:gcc-8.ompi-4.0 AS build

RUN yum install -y \
        epel-release && \
    yum install -y \
        cmake3 \
        make \
        wget && \
    ln -s /usr/bin/cmake3 /usr/bin/cmake && \
    rm -rf /var/cache/yum/*

# LAMMPS version stable_3Mar2020 for Intel Platform
RUN yum install -y \
        bc \
        hwloc-devel \
        tar \
        which \
        eigen3-devel \
        fftw3-devel \
        python-devel && \
    rm -rf /var/cache/yum/*

RUN mkdir -p /var/tmp && wget -q -nc --no-check-certificate -P /var/tmp https://github.com/lammps/lammps/archive/stable_3Mar2020.tar.gz && \
    mkdir -p /var/tmp && tar -x -f /var/tmp/stable_3Mar2020.tar.gz -C /var/tmp -z && \
    cd /var/tmp/lammps-stable_3Mar2020/cmake && \
    mkdir -p /var/tmp/lammps-stable_3Mar2020/build-Intel && cd /var/tmp/lammps-stable_3Mar2020/build-Intel && \
    cmake -C /var/tmp/lammps-stable_3Mar2020/cmake/presets/most.cmake \
        -D CMAKE_INSTALL_PREFIX=/opt/lammps \
        -D CMAKE_BUILD_TYPE=Release \
        -D BUILD_MPI=yes \
        -D BUILD_OMP=yes \
        -D PKG_USER-ADIOS=no \
        /var/tmp/lammps-stable_3Mar2020/cmake && \
    cmake --build /var/tmp/lammps-stable_3Mar2020/build-Intel --target all -- -j$(nproc) && \
    cmake --build /var/tmp/lammps-stable_3Mar2020/build-Intel --target install -- -j$(nproc) && \
    rm -rf /var/tmp/lammps-stable_3Mar2020/cmake /var/tmp/stable_3Mar2020.tar.gz /var/tmp/lammps-stable_3Mar2020/build-Intel


#===========================#
# multi-stage: install
#===========================#

FROM sjtuhpc/hpc-base-container:gcc-8.ompi-4.0

# LAMMPS version stable_3Mar2020 for Intel Platform
RUN yum install -y \
        epel-release && \
    yum install -y \
        bc \
        hwloc-devel \
        which \
        eigen3-devel \
        fftw3-devel \
        python-devel && \
    rm -rf /var/cache/yum/*
COPY --from=build /opt/lammps /opt/lammps
ENV LD_LIBRARY_PATH=/opt/lammps/lib:$LD_LIBRARY_PATH \
    PATH=/opt/lammps/bin:$PATH
