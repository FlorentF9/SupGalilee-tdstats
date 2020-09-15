FROM debian:latest

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y python3.7 python3-pip

ADD requirements.txt ./requirements.txt

RUN pip3 install -r requirements.txt

ADD td ./td
ADD data ./data

VOLUME /td

WORKDIR /td

CMD jupyter-lab --ip 0.0.0.0 --port 9999 --no-browser --allow-root
