
#!/bin/sh
set -e

i=$1

if [ -z $1 ]; then
	echo "Usage: $0 [number of nginx containers to launch]"
    exit 1
fi

apk add docker

service docker start
rc-update add docker

docker run -d --name balancer -p 80:80 suncheez/nginx:balancer

for n in `seq 1 $1`;
        do
    echo Container: $n
	docker run -d --name nginx$n suncheez/nginx:balancer
done