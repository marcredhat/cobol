
marccobolubicontainer=$(buildah from registry.access.redhat.com/ubi8/ubi-minimal:latest)
export CONTAINER_FS=$(buildah mount)
buildah run $marccobolubicontainer microdnf update -y && \
buildah run $marccobolubicontainer microdnf install make git curl findutils wget tar xz gcc bison flex  gmp gmp-devel libtool-ltdl libtool-ltdl-devel  libdb libdb-devel -y && \
buildah run $marccobolubicontainer  curl -L https://......../gnucobol-3.0-rc1.tar.xz?dl=1 -o gnucobol-3.0-rc1.tar.xz && \
buildah run $marccobolubicontainer  tar -xvf gnucobol-3.0-rc1.tar.xz && \
buildah config --workingdir  /gnucobol-3.0-rc1 ${marccobolubicontainer} && \
buildah run $marccobolubicontainer  ./configure && \
buildah run $marccobolubicontainer make && \
buildah run $marccobolubicontainer  make install && \
buildah run $marccobolubicontainer  ldconfig && \
buildah config --cmd /bin/sh ${marccobolubicontainer} && \
#buildah run $marccobolubicontainer -- sh -c "cobc --help" && \
buildah run $marccobolubicontainer wget  https://raw.githubusercontent.com/marcredhat/cobol/master/shortest.cbl && \
buildah run $marccobolubicontainer -- sh -c "cobc -x -free shortest.cbl" && \
buildah run $marccobolubicontainer -- sh -c "export LD_LIBRARY_PATH=/usr/local/lib; ./shortest"
