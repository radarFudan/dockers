# dockers

docker build -t shida_docker:1.0 ./
docker build -t shida_docker:2.0 ./ (11.7.0 -> 11.7.1)

docker run -it --gpus=all --name shida_docker_test shida_docker:1.0