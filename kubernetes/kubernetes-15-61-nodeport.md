docker ps

docker stop $(docker ps -q) 
docker rm $(docker ps -a -q)
docker rmi $(docker images -q)
docker system prune

sudo vim cluster.yml

kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4

nodes:
  - role: control-plane
    extraPortMappings:
       - containerPort: 30082
        hostPort: 30082
  - role: worker
          

kind create cluster --config cluster.yml --image kindest/node:v1.32.0

kubectl get nodes

cd notes-app
ls 
autoScaler hpa.yml load-generator.yml notes.yml vpa.yml

sudo vim notes.yml
apiVersion: v1
kind: Namespace
metadata:
  name: notes-ns
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: notes-app
  namespace: notes-ns
  labels:
    app: notes-app
spec:
  replicas: 1
  selector:
    matchLabels:
      app: notes-app
  template:
    metadata:
      labels:
        app: notes-app
    spec:
      containers:
        - name: notes-app
          image: anil/notes-app:latest
          ports:
            - containerPort: 80
          resources:
            requests:
              cpu: "100m"
            limits:
              cpu: "200m"
          volumeMounts:
            - name: notes-temp
              mountPath: /data
      volumes:
        - name: notes-temp
          emptyDir: {}
---
apiVersion: v1
kind: Service
metadata:
  name: notes-svc
  namespace: notes-ns
spec:
  type: NodePort
  selector:
    app: notes-app
  ports:
    - port: 80
      targetPort: 80
      nodePort: 30082
      protocol: TCP

kubectl apply -f notes.yml

kubectl get pods -n notes-ns
kubectl get all -n notes-ns
