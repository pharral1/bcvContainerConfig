docker rm -f $(docker ps -a -q -f status=exited)
#docker rmi $(docker images -q)