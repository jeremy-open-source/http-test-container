FROM python:3.10

RUN pip install --upgrade pip

ARG USER_ID=1000
ARG USER_GROUP_ID=1000
ARG USER_NAME=http-test-container
ARG USER_GROUP_NAME=http-test-container
ARG PROJECT_PATH=/home/${USER_NAME}/code

RUN     addgroup --gid ${USER_GROUP_ID} ${USER_GROUP_NAME} \
    &&  adduser ${USER_NAME} --uid ${USER_ID} --gid ${USER_GROUP_ID} --gecos "" --disabled-login --disabled-password --home /home/${USER_NAME} \
    &&  mkdir -p ${PROJECT_PATH}

USER ${USER_NAME}
WORKDIR ${PROJECT_PATH}

ENV PATH="${PATH}:/home/${USER_NAME}/.local/bin"

COPY ./requirements.txt ./
RUN pip3 install -r ${PROJECT_PATH}/requirements.txt
COPY bin ./bin
COPY app ./app

CMD ["./bin/entrypoint.sh"]
