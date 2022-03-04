# MODNet-Docker
MODNet (https://github.com/ZHKKKe/MODNet) is a real-time portrait matting solution

This repo dockerizes the MODNet model above


## How to Run:

Make sure you have docker desktop installed. Then

- Pull this repo
- Put your input images inside `demo/image_matting/input` directory
- Build the docker container `make dev-start`
- Run the docker container `make bash`
- Now you will find yourself inside the container with the mount point `/mnt#`
- Run the python inference script inside the container
```
/mnt# python inference.py --input_path demo/image_matting/input --output_path demo/image_matting/output --ckpt_path ./pretrained/modnet_photographic_portrait_matting.ckpt
```
