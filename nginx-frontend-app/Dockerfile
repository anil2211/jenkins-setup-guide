FROM nginx:alpine

WORKDIR /usr/share/nginx/html
COPY nginx-frontend-app/index.html ./
COPY styles.css ./

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
