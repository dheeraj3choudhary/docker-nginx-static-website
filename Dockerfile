# Use the official Nginx image from Docker Hub
# Alpine variant is lightweight (~23MB)
FROM nginx:alpine

# Copy the static HTML file to Nginx's default directory
COPY index.html /usr/share/nginx/html/

# Expose port 80 for web traffic
EXPOSE 80