FROM python:alpine3.7
LABEL Xueshan Feng <xueshan.feng@gmail.com>

RUN pip install virtualenv \
   && rm -rf /var/cache/apk/*

WORKDIR /app
COPY requirements.txt /app/requirements.txt
RUN virtualenv /env && /env/bin/pip install -r /app/requirements.txt
ENTRYPOINT ["/env/bin/awslogs"]
