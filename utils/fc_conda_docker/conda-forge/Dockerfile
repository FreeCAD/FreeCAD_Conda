FROM condaforge/linux-anvil:latest
RUN yum install -y libXt-devel libXmu-devel libXi-devel mesa-libGLU-devel rsync git
RUN cd /opt && git clone https://github.com/looooo/FreeCAD_Conda && cd FreeCAD_Conda
RUN export PATH="/opt/conda/bin:${PATH}" && \
    conda config --add channels freecad && \
    conda update --all --yes

ENTRYPOINT [ "/usr/local/bin/tini", "--", "/opt/docker/bin/entrypoint" ]
CMD [ "/bin/bash" ]