FROM pytorch/pytorch:1.13.0-cuda11.6-cudnn8-runtime

RUN  apt-get update && apt-get install -y \
	gcc \
	git \
	ffmpeg \
	libsm6 \
	libxext6

SHELL ["/bin/bash", "-c"]
RUN python -m pip install --upgrade pip \
	&& pip install -U openmim \
	&& conda install cudatoolkit=11.6 -c conda-forge -y \
	&& mim install mmengine \ 
	&& mim install "mmcv>=2.0.0" \
	&& mim install mmdet \

CMD /bin/bash
EXPOSE 3000

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8
ENV CUDA_VISIBLE_DEVICES=0
ENV PATH /usr/local/cuda-11.6/bin:$PATH
ENV LD_LIBRARY_PATH /usr/loca/cuda-11.6/lib64:$LD_LIBRARY_PATH
