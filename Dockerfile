# FROM: <image>:<tag>
# 가급적 latest는 피하는 게 좋음. 버전이 업데이트될 수 있음
FROM python:3.9.10-bullseye

# LABEL: 이미지에 메타데이터를 추가할 수 있음
LABEL maintainer="taehunkim@hanyang.ac.kr"

# RUN: 이미지 구축 과정에서 실행할 명령어
RUN apt-get update &&\
    apt-get upgrade -y\
    apt-get install wget -y\
    apt-get install git -y\
    apt-get install vim -y

# WORKDIR: 쉘에서 cd와 같음. default는 $HOME
WORKDIR /workspace/

# COPY src dst
# COPY: 로컬 파일을 복사해 이미지에 추가
# 이미지 내부 경로는 WORKDIR에서 시작함
COPY requirements.txt .

# ADD: COPY와 같지만, 로컬 파일이 아니라 인터넷으로부터 복사도 가능
ADD https://arxiv.org/pdf/1905.13311.pdf test.pdf

RUN pip install -r requirements.txt

# ENTRYPOINT: 컨테이너 띄울 시 먼저 실행됨
# CMD도 비슷한데 둘다 거의 안씀
ENTRYPOINT pwd

# EXPOSE: 노출할 포트 지정
EXPOSE 80