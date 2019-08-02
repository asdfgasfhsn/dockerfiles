FROM ubuntu:18.04

## 
## docker run -it --rm \
##  -v ${PATH_TO_SRC_DIR}\libretro-super:/workspace \
##  -v ${PATH_TO_SRC_DIR}/${LIB_RETRO_MODULE}:/workspace/${LIB_RETRO_MODULE} \
##  retroarch-build:local bash 
##

RUN apt-get update && apt-get install -y software-properties-common git build-essential
RUN add-apt-repository -y ppa:libretro/testing
RUN apt-get update
