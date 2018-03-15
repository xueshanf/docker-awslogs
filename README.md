docker-awslogs
==============

[awslogs](https://github.com/jorgebastida/awslogs) in container.

This repo triggers auto-build and push images to dockerhub.com/u/xueshanf/awslogs

To build the image

```console
$ docker build -t myawslogs .
...
```
Examples
========

Assuming the image name you built is `myawslogs`.

- Get help

```console
$ docker run --rm -it -v $HOME/.aws:/root/.aws myawslogs -h
usage: awslogs [ get | groups | streams ]

positional arguments:
  {get,groups,streams}

optional arguments:
  -h, --help            show this help message and exit
  --version             show program's version number and exit
```

-  Check version

```console
$ docker run --rm -it -v $HOME/.aws:/root/.aws myawslogs --version
awslogs 0.10.0
```

- Get all log groups

```console
$ docker run --rm -it -v $HOME/.aws:/root/.aws myawslogs groups --profile <profile>
tf-vpc-flow-log-group
```

- Get log from a log group

```console
$  docker run --rm -it -v $HOME/.aws:/root/.aws myawslogs get tf-vpc-flow-log-group -s1h --profile <profile>
tf-vpc-flow-log-group eni-0fab3xxx-all 2 0123456789012 eni-0fab3xxx 10.10.2.97 10.10.5.51 2379 38792 6 299 1951289 1521139516 1521140117 ACCEPT OK
...
```

- Tail a log and grep some pattern

```console
$ docker run --rm -it -v $HOME/.aws:/root/.aws myawslogs get tf-vpc-flow-log-group ALL --watch  --profile <profile>
tf-vpc-flow-log-group eni-078d6xxx-all 2 01234567890 eni-078d6xxx 77.159.91.3 10.10.5.112 14635 23 6 1 40 1521143033 1521143092 REJECT OK
tf-vpc-flow-log-group eni-08101yyy-all 2 01234567890 eni-08101yyy 175.207.250.173 10.10.4.164 1151 23 6 1 40 1521143076 1521143133 REJECT OK
tf-vpc-flow-log-group eni-02a6azzz-all 2 01234567890 eni-02a6axxx 139.162.72.191 10.10.5.91 44743 3127 6 1 40 1521143107 1521143165 REJECT OK
```
