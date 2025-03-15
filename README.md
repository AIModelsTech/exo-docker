# Exo Docker

### Build the image

```bash
docker build -t exo .
```

### Run the container

```bash
docker run -it -p 52415:52415 exo
```

### Build the nvidia image

```bash
docker build -t exo-nvidia --file Dockerfile.nvidia .
```

### Run the nvidia container

```bash
docker run -it --gpus all -p 52415:52415 exo-nvidia
```

### Run the container with a volume

```bash
mkdir downloads
docker run -it -p 52415:52415 -v $(pwd)/downloads:/root/.cache/exo/downloads exo
```

### Run the nvidia container with a volume

```bash
mkdir downloads
docker run -it --gpus all -p 52415:52415 -v $(pwd)/downloads:/root/.cache/exo/downloads exo-nvidia
```
