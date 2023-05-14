FROM pytorch/pytorch:1.13.0-cuda11.6-cudnn8-runtime
ARG DEBIAN_FRONTEND=noninteractive

RUN  apt-get update && apt-get install -y \
	gcc \
	git \
	ffmpeg \
	libsm6 \
	libxext6

SHELL ["/bin/bash", "-c"]
RUN python -m pip install --upgrade pip \
	&& pip install -U openmim \
	&& mim install mmengine \ 
	&& mim install "mmcv>=2.0.0" \
	&& mim install mmdet \