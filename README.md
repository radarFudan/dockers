# dockers

docker build -t shida_docker:1.0 ./
docker build -t shida_docker:2.0 ./ (11.7.0 -> 11.7.1)
docker build -t shida_docker:2.1 ./ (python3.9)
docker build -t shida_docker:2.2 ./ (S5 requirements + jax 11 local )

docker run -it --gpus=all
