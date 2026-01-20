Part 1: Build & Run

Build the image:

docker build -t nginx-frontend:lab .


Run the container:

docker run --name nginx-frontend-app -p 8080:80 nginx-frontend:lab


Check container status:

docker ps -a

Part 2: Debugging

Check logs:

docker logs nginx-frontend-app
