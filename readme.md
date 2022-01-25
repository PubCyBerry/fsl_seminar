# 잡기술 세미나 <!-- omit in toc -->

- [Install Prerequisites](#install-prerequisites)
- [SSH](#ssh)
- [Docker](#docker)
- [Docker-Compose](#docker-compose)
- [Git](#git)

---

## Install Prerequisites

- VSCode: <https://code.visualstudio.com>

- Git: <https://github.com/git-guides/install-git>

- Docker: <https://docs.docker.com/engine/install>

- Docker-Compose: <https://docs.docker.com/compose/install>

---

## SSH

- 기본 사용법:

  ```sh
  ssh <hostname>@<ip>
  ```

- A에서 B로 파일 복사:

  ```sh
  scp -r <src_path> <host_B>@<ip_B>:<dst_path>
  ```

  - 부분적으로 정규식 지원(like glob)

- Host에 내 키 등록

  ```sh
  ssh-keygen
  ssh-copy-id -i <key_path> <hostname>@<ip>
  sudo systemctl restart sshd
  ```

---

## Docker

- sudo 없이 도커 쓰기

  ```sh
  sudo usermod -aG docker <username>
  ```

- 도커 이미지 받기

  ```sh
  docker pull <image_url>:<tag>
  ```

- 도커 이미지로 컨테이너 만들기 (run = pull + create)

  ```sh
  docker create <flags> test <image>:<tag> <command>
  docker run <flags> test <image>:<tag> <command>
  ```

  python 3.9 bullseye 이미지로 일회용 컨테이너 만들고, 터미널 연결하기

  ```sh
  docker run -it --rm --name test python:3.9.10-slim-buster bash
  ```

  현실적인 예시

  ```sh
  docker run -it --gpus all --name DockerTorch_fsl_taehun -v $PWD:/workspace/ --ipc host -p 88888:8888 pytorch/pytorch:1.10.0-cuda11.3-cudnn8-runtime zsh
  ```

- 현재 보유중인 이미지 목록 확인하기

  ```sh
  docker image ls
  ```

- 이미지 삭제하기

  ```sh
  docker rmi <image>
  ```

- 실행중인 컨테이너 확인하기 (-a: 모든 컨테이너)

  ```sh
  docker ps -a
  ```

- 컨테이너 접속하기(attach vs exec)

  ```sh
  docker attach <container>
  docker exec -itu 0 <container> <command>
  ```

- 컨테이너 중단/시작/재시작하기

  ```sh
  docker stop <container>
  docker start <container>
  docker restart <container>
  ```

- 도커 파일로부터 이미지 만들기

  ```sh
  docker build --no-cache --tag <tag> <Dockerfile_path>
  ```

- 도커 이미지 업데이트하기
  
  ```sh
  docker commit <container> <image_name>:<tag>
  ```

- 도커 이미지 배포하기

  ```sh
  docker login
  docker push <image>:<tag>
  ```

---

## Docker-Compose

- 기본 사용법

  ```sh
  docker-compose up -d
  ```

- docker-compose.yml 위치를 지정할 경우

  ```sh
  docker-compose -f docker/docker-compose.yml -p Lab_tf up -d
  ```

- 도커 이미지(들) 중단/삭제/재시작

  ```sh
  docker-compose stop
  docker-compose down
  docker-compose restart
  ```

---

## Git

- 로컬 저장소 생성

  ```sh
  git init .
  ```

- 변경사항 업데이트

  ``` sh
  git add .
  ```

- 커밋(-m을 안 붙이면 에디터가 나옴)

  ```sh
  git commit -m 'first commit'
  ```

- 원격 저장소 연결

  ```sh
  git remote add origin <url>
  ```

- 원격 저장소에 로컬 저장소 수정사항 반영

  ```sh
  git push (origin master)
  ```

- 로컬 저장소에 원격 저장소 수정사항 반영(`git fetch` + `git merge`)

  ```sh
  git pull (origin master)
  ```

- 현재 저장소 상태 확인

  ```sh
  git status
  ```

- 최고로 이쁜 저장소 로그 확인(alias/.gitconfig에 등록해서 쓰자)

  ```sh
  git log --all --decorate --graph
  ```

- 원격 저장소 다운받기

  ```sh
  git clone <url> .
  ```

- 커밋 되돌리기

  ```sh
  git reset <hash>
  git revert <hash>
  ```

- 브랜치로 이동/브랜치 생성 후 이동하기

  ```sh
  git checkout <branch>
  git checkout -b <branch> (master)
  ```

- 현재 브랜치와 리모트 브랜치 연결하기

  ```sh
  git branch --set-upstream-to origin/<branch>
  ```

- 브랜치 삭제하기

  ```sh
  git branch -d <branch>
  ```

- 브랜치 합치기(no ff: 브랜치를 남기고 병합)

  ```sh
  git merge <branch>
  git merge --no-ff <branch>
  ```
