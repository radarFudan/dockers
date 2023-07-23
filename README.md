# dockers

docker build -t shida_docker:1.0 ./
docker build -t shida_docker:2.0 ./ (11.7.0 -> 11.7.1)
docker build -t shida_docker:2.1 ./ (python3.9)
docker build -t shida_docker:2.2 ./ (S5 requirements + jax 11 local )
docker build -t shida_docker:2.3 ./ (cudnn, wandb, tensorflow)
docker build -t shida_docker:2.4 ./ (datasets)
docker build -t shida_docker:2.5 ./ (tensorflow=2.12.0, datasets merged into previous line)
docker build -t shida_docker:2.6 ./ (tensorflow before jax local)

docker run -it --gpus=all shida_docker:2.6
