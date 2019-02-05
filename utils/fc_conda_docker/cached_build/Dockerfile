FROM condaforge/linux-anvil:latest

# set env-variables
ENV FC_SOURCE="/opt/FreeCAD"

# install some libs
RUN yum install -y libXt-devel libXmu-devel libXi-devel mesa-libGLU-devel rsync git

# clone repos
RUN cd /opt && git clone https://github.com/looooo/freecad-feedstock && \
    cd freecad-feedstock && git checkout local-build && cd ..

RUN git clone https://github.com/FreeCAD/FreeCAD

RUN export PATH="/opt/conda/bin:${PATH}" && \
    conda config --remove channels conda-forge && \
    conda config --add channels conda-forge/label/cf201901 && \
    conda config --add channels freecad && \
    conda install conda=4.5.* conda-build --yes

RUN export PATH="/opt/conda/bin:${PATH}" && \
    export FC_SOURCE="/opt/FreeCAD" && \
    cd opt/freecad-feedstock && \
    conda build . -m .ci_support/linux_.yaml

ENTRYPOINT [ "/usr/local/bin/tini", "--", "/opt/docker/bin/entrypoint" ]
CMD [ "/bin/bash" ]