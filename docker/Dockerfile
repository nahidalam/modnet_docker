FROM manifoldai/orbyter-ml-dev:3.5
ADD requirements.txt /build/requirements.txt
WORKDIR /build/
RUN pip install -r requirements.txt
WORKDIR /mnt/