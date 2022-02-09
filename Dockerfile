FROM python:3.8-buster

WORKDIR /build/

ENV PYTHONPATH=/build/

COPY . /build/

COPY requirements.txt /build/

RUN pip install -r requirements.txt

ENTRYPOINT ["python", "./inference.py"]
