![docker pulls](https://img.shields.io/docker/pulls/swaraj/zookeeper_docker.svg)

![docker stars](https://img.shields.io/docker/stars/swaraj/zookeeper_docker.svg)

### To Run in Ensemble Mode

Below instructions are for test run as this image is already having zoo.cfg port configuration such as you can run three docker instances on your machine to create the ensemble, for production having seperate ports as is in the image is not required.

#### Run First instance

```
docker run -id --name zookeeper1 --net=host -p 2181:2181 -p 2888:2888 -p 3887:3887 swaraj/zookeeper_docker
docker exec -it zookeeper1 /bin/bash
```


open zoo config file


```
vim /opt/zookeeper/conf/zoo.cfg
```


change the dataDir to /opt/zookeeper/data

change client port to 2181

change the hostname/ip in server.1 etc lines

open myid file from data directory


```
vim /opt/zookeeper/data/myid 
```


write 1 in the file to mark this instance as server 1 in ensemble.


#### Run Second instance

```
docker run -id --name zookeeper2 --net=host -p 2182:2182 -p 2888:2888 -p 3888:3888 swaraj/zookeeper_docker
docker exec -it zookeeper2 /bin/bash
```


open zoo config file


```
vim /opt/zookeeper/conf/zoo.cfg
```


change the dataDir to /opt/zookeeper/data

change client port to 2182

change the hostname/ip in server.1 etc lines

open myid file from data directory


```
vim /opt/zookeeper/data/myid 
```


write 2 in the file to mark this instance as server 2 in ensemble.



#### Run Third instance

```
docker run -id --name zookeeper3 --net=host -p 2183:2183 -p 2888:2888 -p 3889:3889 swaraj/zookeeper_docker
docker exec -it zookeeper3 /bin/bash
```


open zoo config file


```
vim /opt/zookeeper/conf/zoo.cfg
```


change the dataDir to /opt/zookeeper/data

change client port to 2183

change the hostname/ip in server.1 etc lines

open myid file from data directory


```
vim /opt/zookeeper/data/myid 
```


write 3 in the file to mark this instance as server 3 in ensemble.

### Starting zookeeper ensemble

now go to bin directory in each instance run zkServer.sh script as follows:

```
cd /opt/zookeeper/bin
run ./zkServer.sh start
```


in all 3 server instances


##### your zookeeper ensemble is up and running!!


### For Production:

Hostname will be different for each instance as each will run in a different machine, you can keep ports same for each instance too.
