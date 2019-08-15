# Running a docker container using Nvidia GPU, Tensorflow, Python 3.7 and Jupyter Lab

1. Install updated version of docker, so will not require --runtime=nvidia as the run command.http://collabnix.com/introducing-new-docker-cli-api-support-for-nvidia-gpus-under-docker-engine-19-03-0-beta-release/

2. Find out user id and group id `id -a`, replace these within the Dockerfile.

3. Create docker image: `sudo docker build . -t lab-gpu`

4. Run docker container in detached mode: ```sudo docker run --gpus all -p 8888:8888 -v PATH:/home/jovyan/ -d lab-gpu```

5. Get container id: `sudo docker ps -a`

6. Find out jupyter notebook token: ```sudo docker exec -it CONTAINER_ID /bin/bash```
```jupyter notebook list```
```exit```

7. On a browser, go to IP:8888 and enter the token.
