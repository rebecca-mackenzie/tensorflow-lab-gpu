FROM tensorflow/tensorflow:2.0.0a0-gpu-py3-jupyter

# Set up user environment variables. #set UID and GID to the same as host
ENV NB_USER=jovyan \
    NB_UID=33326 \
    NB_GID=1182 
#
# Export important paths.
#ENV PATH=/home/jovyan/.local/bin:$PATH

ENV SHELL=/bin/bash \
    HOME=/home/$NB_USER

# Create non-root user.
RUN useradd -m -s $SHELL -N -u $NB_UID $NB_USER

#create a new group
RUN groupadd -g $NB_GID jovyan

#set as primary group
RUN usermod -g jovyan jovyan

#Set home
WORKDIR $HOME

#Install packages
RUN pip install matplotlib
RUN pip install pandas
RUN pip install numpy
RUN pip install scipy
RUN pip install h5py
RUN pip install jupyterlab
RUN pip install sklearn
RUN pip install seaborn

USER $NB_USER

ENTRYPOINT ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888"]

