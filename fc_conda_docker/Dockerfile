FROM continuumio/miniconda:latest
RUN apt-get -y update
RUN apt-get -y install freeglut3-dev build-essential xorg-dev
RUN conda config --add channels conda-forge
RUN conda config --add channels freecad
RUN conda install conda-build -y
RUN conda update --all -y

ENV PATH /opt/conda/bin:$PATH
ENTRYPOINT [ "/usr/bin/tini", "--" ]
CMD [ "/bin/bash" ]