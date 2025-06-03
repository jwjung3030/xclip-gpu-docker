FROM nvidia/cuda:12.6.3-runtime-ubuntu22.04

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    git \
    ffmpeg \
    libsm6 \
    libxext6 \
    && apt-get clean

RUN pip3 install --upgrade pip

RUN pip3 install --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/cu126

RUN pip3 install \
    transformers \
    timm \
    accelerate \
    opencv-python \
    decord \
    einops

WORKDIR /workspace

CMD ["/bin/bash"]
