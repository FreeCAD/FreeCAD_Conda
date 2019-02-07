FROM condaforge/linux-anvil:latest

# install some libs
RUN yum install -y libXt-devel libXmu-devel libXi-devel mesa-libGLU-devel rsync git wget unzip

RUN export PATH="/opt/conda/bin:${PATH}" && \
    conda config --remove channels conda-forge && \
    conda config --add channels conda-forge/label/cf201901 && \
    conda config --add channels freecad && \
    conda install conda-build --yes && \
    conda update --all --yes

# clone repos
RUN cd /opt && git clone https://github.com/looooo/freecad-feedstock && \
    cd freecad-feedstock && git checkout local-build && cd ..

# download latest FreeCAD/master
RUN cd /opt && \
    wget https://github.com/FreeCAD/FreeCAD/archive/master.zip -O FreeCAD-master.zip && \
	unzip FreeCAD-master.zip && \
	rm FreeCAD-master.zip && \
	mv FreeCAD-master FreeCAD

# build freecad
RUN export PATH="/opt/conda/bin:${PATH}" && \
    cd /opt/freecad-feedstock && \
    conda build . -k -m .ci_support/linux_.yaml

# delete source (replace later with shared directory)
RUN rm -rf /opt/FreeCAD

ENTRYPOINT [ "/usr/local/bin/tini", "--", "/opt/docker/bin/entrypoint" ]
CMD [ "/bin/bash" ]