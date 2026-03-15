FROM nginx:stable-alpine

# Set working directory
WORKDIR /usr/share/nginx/html

# Remove default nginx files
RUN rm -rf ./*

# Copy React/Vite build files
COPY dist/ .

# Nginx will run on default PORT 80 (NO CHANGE NEEDED)

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
