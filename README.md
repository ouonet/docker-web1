# docker-web1
very simple web server for testing loadbalance of docker swarm 。
two server is provided : 
+ aneotop/web1 , which is based on nodejs  

	> docker run --rm -p 80:8888 aneotop/web 
	
+ aneotop/web1:nc which is based on busybox and nc ,locating at nc-web.
	
	> docker run --rm -p 80:1500 aneotop/web:nc
 
# install docker
_centOs 7_

	bash script/i4centos.sh

_ubuntu 16_

	bash script/i4ubuntu.sh

# init swarm clust
to deploy swarm clust , 3 machines are needed.
## step1 init manage node 
	#select one of these 3 machines,run:
	docker swarm init --advertise-addr localip
	#if your machine has only one ethernet interface card, the option of advertise-addr can be ommited
## step2 add other 2 machines into manager
run command at first machine
	docker swarm join-token manager
get following hints:
	
	To add a manager to this swarm, run the following command:
	docker swarm join --token SWMTKN-1-1rd7brd57191zer4nw4if44oh524b0akewaw9au30af5ngr0q6-evdgvgwwdd5j42az7gcosfbzm 192.168.137.140:2377
run command at other 2 machines

	docker swarm join --token SWMTKN-1-1rd7brd57191zer4nw4if44oh524b0akewaw9au30af5ngr0q6-evdgvgwwdd5j42az7gcosfbzm 192.168.137.140:2377

## step3 to add more workers to swarm clust
run command at first machine

	docker swarm join-token worker

get following hints:

	To add a worker to this swarm, run the following command:
	docker swarm join --token SWMTKN-1-1rd7brd57191zer4nw4if44oh524b0akewaw9au30af5ngr0q6-a5x1syrylfl15g35mejj8femu 192.168.137.140:2377

run command at other 2 machines

	docker swarm join --token SWMTKN-1-1rd7brd57191zer4nw4if44oh524b0akewaw9au30af5ngr0q6-a5x1syrylfl15g35mejj8femu 192.168.137.140:2377

# deploy web server 
	docker stack deploy -c docker-compose.yml web
	#or
	docker stack deploy -c nc-web/docker-compose.yml web
	
