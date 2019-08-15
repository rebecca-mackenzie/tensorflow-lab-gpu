FROM tensorflow/tensorflow:latest-gpu-py3-jupyter

# Set up user environment variables.
#ENV NB_USER=jovyan \
#    NB_UID=1000 \
#    NB_GID=1182 
#
# Export important paths.
#ENV PATH=/home/jovyan/.local/bin:$PATH

#ENV SHELL=/bin/bash \
#    HOME=/home/$NB_USER

# Create non-root user.
#RUN useradd -m -s $SHELL -N -u $NB_UID $NB_USER

# Change to jovyan user to install JupyterHub and any user space utils.
#USER $NB_USER
#WORKDIR $HOME

#Install packages
RUN pip install matplotlib
RUN pip install pandas
RUN pip install numpy
RUN pip install scipy
RUN pip install h5py
RUN pip install jupyterlab
RUN pip install sklearn

ENTRYPOINT ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--allow-root"]

