# dockers

docker build -t shida_docker:1.0 ./
docker build -t shida_docker:2.0 ./ (11.7.0 -> 11.7.1)
docker build -t shida_docker:2.1 ./ (python3.9)

docker run -it --gpus=all 618f1f20d22c
