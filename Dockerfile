FROM nginx:stable-alpine
# Copy the pre-built static files into the Nginx html directory
COPY dist/ /usr/share/nginx/html/
# Expose port 80 for the Nginx server
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
