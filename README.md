docker-awslogs
==============

``awslogs`` is a simple command line tool for querying groups, streams and events from [Amazon CloudWatch](http://aws.amazon.com/cloudwatch/) logs. Please see full features in the [awslogs](https://github.com/jorgebastida/awslogs).

This repository builds `awslogs` container image. You can get the image by `docker pull xueshanf/awslogs`.
To build your own:

```console
$ docker build -t awslogs .
...
```

Examples
========

Let's assume you have setup AWS cloudwatch, your AWS credentials is configured in $HOME/.aws/credentials file, the image name you built is `awslogs`.

- Get help

```console
$ docker run --rm -it -v $HOME/.aws:/root/.aws awslogs -h
usage: awslogs [ get | groups | streams ]
...
```

-  Check version

```console
$ docker run --rm -it -v $HOME/.aws:/root/.aws awslogs --version
awslogs 0.10.0
```

- Get all log groups

```console
$ docker run --rm -it -v $HOME/.aws:/root/.aws awslogs groups --profile <profile>
tf-vpc-flow-log-group
```
- Get all streams from a log group

```console
$ docker run --rm -it -v $HOME/.aws:/root/.aws awslogs streams <group name> --profile <profile>
ip-10-10-1-12.us-west-2.compute.internal
ip-10-10-1-30.us-west-2.compute.internal
ip-10-10-1-36.us-west-2.compute.internal
ip-10-10-2-43.us-west-2.compute.internal
```

- Get log from a log group

```console
$  docker run --rm -it -v $HOME/.aws:/root/.aws awslogs get tf-vpc-flow-log-group -s1h --profile <profile>
tf-vpc-flow-log-group eni-0fab3xxx-all 2 0123456789012 eni-0fab3xxx 10.10.2.97 10.10.5.51 2379 38792 6 299 1951289 1521139516 1521140117 ACCEPT OK
...
```

- Tail a log and grep some pattern

```console
$ docker run --rm -it -v $HOME/.aws:/root/.aws awslogs get tf-vpc-flow-log-group ALL --watch  --profile <profile>
tf-vpc-flow-log-group eni-078d6xxx-all 2 01234567890 eni-078d6xxx 77.159.91.3 10.10.5.112 14635 23 6 1 40 1521143033 1521143092 REJECT OK
tf-vpc-flow-log-group eni-08101yyy-all 2 01234567890 eni-08101yyy 175.207.250.173 10.10.4.164 1151 23 6 1 40 1521143076 1521143133 REJECT OK
tf-vpc-flow-log-group eni-02a6azzz-all 2 01234567890 eni-02a6axxx 139.162.72.191 10.10.5.91 44743 3127 6 1 40 1521143107 1521143165 REJECT OK
```
- Use filter

```console
$ docker run --rm -it -v /Users/sfeng/.aws:/root/.aws awslogs get vault-dev-vault -s1d  --profile=<profile> --filter-pattern='{ $.systemdUnit="vault.service" }'
```

