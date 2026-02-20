session 49 k8s

I want to master kubernetes fast.Break it down using the 80/20
rule: whats the 20% that gives me 80% of the results?Keeps it clear and practical

build a skill in 10 days- even from the scratch
"I'm beginner in kubernetes.Design a 10 days roadmap with core principles,short daily actions(30 mn max)
and applied outcomes I can use in real life

**************************************************************************

Kubernetes Notes – Session 51
Namespaces
kubectl get ns
Pod Management
Create Pod from YAML

pods.yml:

apiVersion: v1
kind: Pod
metadata:
  name: nginx-pod
  namespace: nginx-ns
  labels:
    app: nginx
    version: v1
spec:
  containers:
  - name: nginx
    image: nginx:latest
    ports:
    - containerPort: 80

Commands:

kubectl apply -f pods.yml
kubectl get pods -n nginx-ns
kubectl describe pod nginx-pod -n nginx-ns
Create Pod via Command Line
kubectl run nginx-pod --image=nginx:latest --port=80 -n nginx-ns
Notes

Pod: smallest deployable unit in Kubernetes.

Pods share the same network.

Short-lived; Kubernetes recreates them if deleted.

Delete a pod:

kubectl delete pod <pod-name> -n nginx-ns
Deployment Management
Features

Self-healing

Replicas

Scaling ability

Rolling updates

Deployment YAML (deployment.yml)
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  namespace: nginx-ns
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
      version: v1
  template:
    metadata:
      labels:
        app: nginx
        version: v1
    spec:
      containers:
      - name: nginx
        image: nginx:latest
        ports:
        - containerPort: 80

Apply Deployment:

kubectl apply -f deployment.yml
kubectl get pods -n nginx-ns
kubectl get deployment -n nginx-ns
watch kubectl get pods -n nginx-ns

Delete a pod (Deployment auto-recreates):

kubectl delete pod <pod-name> -n nginx-ns
Scaling Deployment
kubectl scale deployment nginx-deployment --replicas=5 -n nginx-ns
kubectl get deployment -n nginx-ns
kubectl get pods -n nginx-ns

kubectl scale deployment nginx-deployment --replicas=2 -n nginx-ns
Updating Deployment

Edit deployment YAML:

sudo vim deployment.yml

Change the container image version.

Apply changes:

kubectl apply -f deployment.yml

Kubernetes performs a rolling update: one pod at a time, maintaining user experience.

Services
Service Types

ClusterIP – default, accessible inside cluster.

NodePort – accessible outside cluster via <nodeIP>:<port>.

LoadBalancer – provides public IP & port.

Ingress – public IP & routing rules.

External IP – direct public IP & port.

Service YAML (service.yml)
apiVersion: v1
kind: Service
metadata:
  name: nginx-service
  namespace: nginx-ns
spec:
  selector:
    app: nginx
    version: v1
  ports:
  - port: 80        # Cluster/Host
    targetPort: 80  # Container port
    protocol: TCP
  type: NodePort

Apply Service:

kubectl apply -f service.yml
kubectl get all -n nginx-ns
Port Forwarding
sudo -E kubectl port-forward service/nginx-service -n nginx-ns 80:80 --address=0.0.0.0
Kubernetes Architecture Notes

Kubernetes maintains desired state automatically.

Components:

API Server – entry point for commands

etcd – key-value store for cluster state

Scheduler – assigns pods to nodes

Controller Manager – ensures actual state matches desired state

Kubelet – agent running on worker nodes

Container Runtime – runs containers

Cleanup
kubectl delete ns nginx-ns