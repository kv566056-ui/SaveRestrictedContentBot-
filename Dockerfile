FROM python:3.9-slim-bullseye

WORKDIR /app

ENV DEBIAN_FRONTEND=noninteractive

# Fix for network + new Debian version
RUN apt-get update -o Acquire::Retries=5 -o Acquire::http::No-Cache=True && \
    apt-get install -y git python3 python3-pip ffmpeg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY . .

RUN pip3 install --no-cache-dir -r requirements.txt

CMD ["bash", "bash.sh"]
