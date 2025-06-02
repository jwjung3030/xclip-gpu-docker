FROM nvidia/cuda:12.6.2-cudnn8-runtime-ubuntu22.04

# 기본 패키지 설치
RUN apt-get update && apt-get install -y \
    git \
    python3 \
    python3-pip \
    ffmpeg \
    libsm6 \
    libxext6 \
    && apt-get clean

# pip 최신화
RUN pip3 install --upgrade pip

# PyTorch Nightly (CUDA 12.6 지원)
RUN pip3 install --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/cu126

# XCLIP 종속성
RUN pip3 install \
    transformers \
    timm \
    accelerate \
    opencv-python \
    decord \
    einops

# 작업 디렉토리
WORKDIR /workspace

# 필요한 경우 모델 코드 복사 혹은 클론
# 예: RUN git clone https://github.com/microsoft/X-CLIP.git .

# 기본 명령어
CMD ["/bin/bash"]
