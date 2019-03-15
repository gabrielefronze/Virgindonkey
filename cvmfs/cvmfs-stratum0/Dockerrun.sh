docker build -t slidspitfire/cvmfs-stratum0-latest:latest .

mkdir -p /var/cvmfs-docker/stratum0/var-spool-cvmfs
mkdir /var/cvmfs-docker/stratum0/cvmfs

docker run -d \
-p 80:80 -p 8000:8000 \
--name cvmfs-stratum0 \
--hostname cvmfs-stratum0 \
--privileged \
--env-file ../cvmfs-variables.env \
--mount type=bind,source=/var/cvmfs-docker/stratum0/var-spool-cvmfs,target=/var/spool/cvmfs,bind-propagation=shared,consistency=consistent \
--mount type=bind,source=/var/cvmfs-docker/stratum0/cvmfs,target=/cvmfs,bind-propagation=shared,consistency=consistent \
--volume /var/cvmfs-docker/stratum0/srv-cvmfs:/srv/cvmfs \
--volume /var/cvmfs-docker/stratum0/etc-cvmfs:/etc/cvmfs \
--volume /sys/fs/cgroup:/sys/fs/cgroup \
slidspitfire/cvmfs-stratum0-latest:latest