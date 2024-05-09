docker_username="anys34"
image_name="jenkins_study"
container_name="springboot"
version="latest"

if [ "$(docker ps -q -f name=${container_name})" ]; then
    docker stop ${container_name}
    docker rm ${container_name}
fi

if [ "$(docker images -q ${docker_username}/${image_name}:${version})" ]; then
    docker rmi ${docker_username}/${image_name}:${version}
fi

docker pull ${docker_username}/${image_name}:${version}

docker run -d -p 8080:8080 --name ${container_name} ${docker_username}/${image_name}:${version}