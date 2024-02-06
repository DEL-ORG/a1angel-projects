FROM postgres
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y curl \
    python3-pip \
    python3-dev \
    groff \
    wget \
    unzip \
    && rm -rf /var/lib/apt/lists/*  
RUN wget "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -O "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -rf aws awscliv2.zip  
WORKDIR /a1angel-backup
COPY . .
RUN chmod +x restore.sh 
ENTRYPOINT ["./restore.sh"]




