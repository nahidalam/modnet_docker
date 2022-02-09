# MODNet-Docker
MODNet (https://github.com/ZHKKKe/MODNet) is a real-time portrait matting solution

This repo dockerizes the MODNet model above


## How to Run:

Make sure you have docker desktop installed. Then

- Pull this repo
- Put your input images inside `demo\image_matting\input` directory
- Build the docker image `docker build -t <image-name> .`
- Run the docker image
```
docker run --rm <image-name> --input-path demo/image_matting/input --output-path demo/image_matting/output --ckpt-path ./pretrained/modnet_photographic_portrait_matting.ckpt
```
