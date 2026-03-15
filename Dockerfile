FROM nginx:stable-alpine

# Set working directory to nginx asset directory
WORKDIR /usr/share/nginx/html

# Remove default nginx static assets
RUN rm -rf ./*

# Copy the pre-built static files from your dist folder
COPY dist/ .

# Custom Nginx configuration to listen on Port 3000 instead of 80
RUN sed -i 's/listen\(.*\)80;/listen 3000;/' /etc/nginx/conf.d/default.conf

# Expose port 3000 for the documentation requirement
EXPOSE 3000

CMD ["nginx", "-g", "daemon off;"]
