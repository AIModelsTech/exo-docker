FROM python:3.12-slim

# Install dependencies
RUN apt-get update && apt-get install -y \
    git \
    libgl1-mesa-glx \
    libglib2.0-0 \
    clang \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
RUN useradd --create-home exo \
    && mkdir -p /home/exo/app \
    && chown -R exo:exo /home/exo/app
WORKDIR /home/exo/app
USER exo

# Add local bin to PATH so that pip-installed executables are found
ENV PATH="/home/exo/.local/bin:${PATH}"

RUN pip install llvmlite

# Clone the exo repository and install the package
RUN git clone https://github.com/exo-explore/exo.git \
    && cd exo \
    && pip install -e .

# Expose the default port
EXPOSE 52415

# Set the entrypoint
ENTRYPOINT ["exo"]