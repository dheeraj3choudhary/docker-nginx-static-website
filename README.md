<div align="center">

# Docker Nginx Static Website

<p align="center">
<a href="https://www.linkedin.com/in/dheeraj-choudhary/" target="_blank">
  <img height="100" alt="Dheeraj Choudhary | LinkedIN"  src="https://user-images.githubusercontent.com/60597290/152035581-a7c6c0c3-65c3-4160-89c0-e90ddc1e8d4e.png"/>
</a> 

<a href="https://www.youtube.com/@dheeraj-choudhary?sub_confirmation=1">
    <img height="100" src="https://user-images.githubusercontent.com/60597290/152035929-b7f75d38-e1c2-4325-a97e-7b934b8534e2.png" />
</a>    
</p>

## [Subscribe](https://www.youtube.com/@dheeraj-choudhary?sub_confirmation=1) to learn more About Artificial-Intellegence, Machine-Learning, Cloud & DevOps. ❤

![alt text](<ArchitectureDiagram.png>)

[![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)](https://www.docker.com/)
[![Nginx](https://img.shields.io/badge/Nginx-009639?style=for-the-badge&logo=nginx&logoColor=white)](https://nginx.org/)
[![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white)](https://developer.mozilla.org/en-US/docs/Web/HTML)

<a href="https://www.buymeacoffee.com/Dheeraj3"><img src="https://img.buymeacoffee.com/button-api/?text=Buy me a coffee&emoji=&slug=Dheeraj3&button_colour=5F7FFF&font_colour=ffffff&font_family=Cookie&outline_colour=000000&coffee_colour=FFDD00"></a>

</div>

A beginner-friendly Docker project that demonstrates how to containerize and deploy a static HTML website using Nginx web server. Perfect for DevOps and Cloud engineers learning Docker fundamentals.

## 📋 Table of Contents

- [Project Overview](#-project-overview)
- [Prerequisites](#-prerequisites)
- [Quick Start](#-quick-start)
- [Directory Structure](#-directory-structure)
- [Troubleshooting](#-troubleshooting)
- [Validation](#-validation)

---

## Project Overview

This hands-on project teaches you fundamental Docker concepts by containerizing a simple static website and serving it with Nginx.

### What You'll Learn

- ✅ **Building Docker Images**: Create optimized images using Dockerfile
- ✅ **Container Management**: Run, stop, and manage Docker containers
- ✅ **Port Mapping**: Expose containerized applications to the host
- ✅ **Nginx Basics**: Serve static content with a production web server
- ✅ **Best Practices**: Implement `.dockerignore` for efficient builds
- ✅ **Image Optimization**: Use Alpine-based images for minimal footprint

### Learning Objectives

By completing this project, you will:

1. Understand the Docker image build process
2. Learn how to write an effective Dockerfile
3. Master basic Docker CLI commands
4. Deploy a web application in an isolated container
5. Troubleshoot common Docker issues

### Use Cases

- Quick static website deployment
- Learning Docker fundamentals
- Testing Nginx configurations
- Creating landing pages or documentation sites
- Base template for more complex web applications

---

## Prerequisites

Before you begin, ensure you have the following installed on your system:

### Required Software

| Software | Minimum Version | Check Command | Installation |
|----------|----------------|---------------|--------------|
| **Docker** | 20.10+ | `docker --version` | [Install Docker](https://docs.docker.com/get-docker/) |

### System Requirements

- **OS**: Linux, macOS, or Windows 10/11 with WSL2
- **RAM**: 2GB minimum
- **Disk Space**: 500MB for images and containers

### Verify Installation

```bash
# Check Docker version
docker --version

# Check Docker is running
docker info

# Check Docker daemon status
docker ps
```

Expected output:
```
Docker version 24.0.0 or higher
```

---

## Quick Start

Follow these steps to get your containerized website running in minutes.

### Step 1: Clone the Repository

```bash
git clone https://github.com/yourusername/docker-nginx-static-website.git
cd docker-nginx-static-website
```

### Step 2: Build the Docker Image

Build the image with a custom tag name:

```bash
docker build -t nginx-static-site .
```

**Command Breakdown:**
- `docker build`: Command to build an image
- `-t nginx-static-site`: Tags the image with name "nginx-static-site"
- `.`: Build context (current directory)

**Expected Output:**
```
[+] Building 2.3s (7/7) FINISHED
 => [1/2] FROM docker.io/library/nginx:alpine
 => [2/2] COPY index.html /usr/share/nginx/html/
 => exporting to image
Successfully tagged nginx-static-site:latest
```

### Step 3: Run the Container

Start a container from your image:

```bash
docker run -d -p 8080:80 --name my-nginx-site nginx-static-site
```

**Command Breakdown:**
- `docker run`: Create and start a container
- `-d`: Run in detached mode (background)
- `-p 8080:80`: Map host port 8080 to container port 80
- `--name my-nginx-site`: Assign a friendly name to the container
- `nginx-static-site`: The image to use

**Expected Output:**
```
a1b2c3d4e5f6... (container ID)
```

### Step 4: Access Your Website

Open your browser and navigate to:

```
http://localhost:8080
```

You should see your static website with a success message! 🎉

---

## 📁 Directory Structure

```
docker-nginx-static-website/
│
├── index.html              # Static HTML website (single-page application)
├── Dockerfile              # Instructions to build the Docker image
│
├── .dockerignore           # Files to exclude from Docker build context
├── .gitignore              # Files to exclude from Git version control
├── .env.example            # Environment variables template (not needed for this project)
│
└── README.md               # Project documentation (you are here)
```

### File Descriptions

| File | Purpose | Required |
|------|---------|----------|
| `index.html` | The static website content served by Nginx | ✅ Yes |
| `Dockerfile` | Defines how to build the Docker image | ✅ Yes |
| `.dockerignore` | Optimizes build by excluding unnecessary files | ✅ Recommended |
| `.gitignore` | Prevents committing unwanted files to Git | ✅ Recommended |
| `.env.example` | Template for environment variables (educational) | ⚪ Optional |
| `README.md` | Complete project documentation | ✅ Yes |

---

## Troubleshooting

### Common Issues and Solutions

#### 1. **Port Already in Use**

**Error:**
```
Error starting userland proxy: listen tcp4 0.0.0.0:8080: bind: address already in use
```

**Solution:**
Use a different port or stop the process using port 8080:

```bash
# Option 1: Use a different port
docker run -d -p 8081:80 --name my-nginx-site nginx-static-site

# Option 2: Find and stop the process using port 8080 (Linux/Mac)
lsof -i :8080
kill -9 <PID>

# Option 2: Windows
netstat -ano | findstr :8080
taskkill /PID <PID> /F
```

---

#### 2. **Container Name Already Exists**

**Error:**
```
Error response from daemon: Conflict. The container name "/my-nginx-site" is already in use
```

**Solution:**
Remove the existing container or use a different name:

```bash
# Option 1: Remove existing container
docker rm -f my-nginx-site

# Option 2: Use a different name
docker run -d -p 8080:80 --name my-nginx-site-2 nginx-static-site
```

---

#### 3. **Docker Daemon Not Running**

**Error:**
```
Cannot connect to the Docker daemon. Is the docker daemon running?
```

**Solution:**

```bash
# Linux
sudo systemctl start docker
sudo systemctl enable docker

# macOS - Start Docker Desktop application

# Windows - Start Docker Desktop application
```

---

#### 4. **Permission Denied (Linux)**

**Error:**
```
permission denied while trying to connect to the Docker daemon socket
```

**Solution:**

```bash
# Add your user to the docker group
sudo usermod -aG docker $USER

# Log out and log back in, then verify
docker ps
```

---

#### 5. **Build Context Too Large**

**Error:**
```
Sending build context to Docker daemon  XXX MB
```

**Solution:**
Ensure `.dockerignore` file is present and includes unnecessary directories:

```bash
# Check what's being sent to build context
docker build --no-cache -t nginx-static-site .

# Verify .dockerignore exists
cat .dockerignore
```

---

#### 6. **Cannot Access Website (404 or Connection Refused)**

**Symptoms:**
- Browser shows "This site can't be reached"
- Connection refused error

**Solution Checklist:**

```bash
# 1. Verify container is running
docker ps

# 2. Check container logs
docker logs my-nginx-site

# 3. Verify port mapping
docker port my-nginx-site

# 4. Test from inside the container
docker exec my-nginx-site curl localhost:80

# 5. Restart the container
docker restart my-nginx-site
```

---

## Validation

Verify your deployment is working correctly with these validation steps.

### 1. Check Container Status

```bash
docker ps
```

**Expected Output:**
```
CONTAINER ID   IMAGE              STATUS         PORTS                  NAMES
a1b2c3d4e5f6   nginx-static-site  Up 2 minutes   0.0.0.0:8080->80/tcp   my-nginx-site
```

✅ Look for: `STATUS` shows "Up" and `PORTS` shows your mapping (8080->80)

---

### 2. Verify Website Access

**Browser Test:**
- Open: `http://localhost:8080`
- ✅ You should see: A styled webpage with "Docker + Nginx" header
- ✅ Success message: "Container is running successfully!"

**Command Line Test:**

```bash
curl http://localhost:8080
```

✅ You should see: HTML content with `<title>Docker Nginx Static Site</title>`

---

### 3. Check Container Logs

```bash
docker logs my-nginx-site
```

**Expected Output:**
```
/docker-entrypoint.sh: Configuration complete; ready for start up
```

✅ No error messages should appear

---

### 4. Verify Image Details

```bash
docker images | grep nginx-static-site
```

**Expected Output:**
```
nginx-static-site   latest    a1b2c3d4e5f6   2 minutes ago   42.6MB
```

✅ Image size should be ~40-45MB (Alpine-based)

---

### 5. Test Port Mapping

```bash
docker port my-nginx-site
```

**Expected Output:**
```
80/tcp -> 0.0.0.0:8080
```

✅ Confirms port 80 in container maps to port 8080 on host

---

### 6. Inspect Container Details

```bash
docker inspect my-nginx-site | grep -A 5 "IPAddress"
```

**Expected Output:**
```json
"IPAddress": "172.17.0.2"
```

✅ Container has a valid IP address

---

### 7. Resource Usage Check

```bash
docker stats --no-stream my-nginx-site
```

**Expected Output:**
```
CONTAINER ID   CPU %   MEM USAGE / LIMIT   MEM %   NET I/O
a1b2c3d4e5f6   0.00%   2.5MiB / 7.5GiB    0.03%   1.5kB / 0B
```

✅ Low CPU and memory usage (Nginx is lightweight)

---

## 🧹 Cleanup

When you're done, clean up your Docker environment:

```bash
# Stop the container
docker stop my-nginx-site

# Remove the container
docker rm my-nginx-site

# Remove the image (optional)
docker rmi nginx-static-site

# Remove unused images and containers (optional)
docker system prune -a
```

---

## 📚 Additional Resources

- [Docker Documentation](https://docs.docker.com/)
- [Nginx Documentation](https://nginx.org/en/docs/)
- [Dockerfile Best Practices](https://docs.docker.com/develop/dev-best-practices/)
- [Docker Hub - Nginx Official Image](https://hub.docker.com/_/nginx)

---

## 🤝 Contributing

This is a learning project. Feel free to fork, modify, and experiment!

---

## 📝 License

This project is open source and available under the [MIT License](LICENSE).

---

## 👨‍💻 Author: Dheeraj Choudhary

Created for DevOps and Cloud Engineers learning Docker fundamentals.

---

**Happy Learning!**