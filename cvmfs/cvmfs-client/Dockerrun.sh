docker-compose -f "${BASH_SOURCE%/*}/../docker-compose.yml" cvmfs-client

docker run -t \
-p 80:80 -p 8000:8000 \
--name cvmfs-client \
--hostname cvmfs-client \
--privileged \
--env-file ../cvmfs-variables.env \
--volume /sys/fs/cgroup:/sys/fs/cgroup \
slidspitfire/cvmfs-client-latest:latest