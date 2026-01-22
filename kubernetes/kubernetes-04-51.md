session 49 k8s

I want to master kubernetes fast.Break it down using the 80/20
rule: whats the 20% that gives me 80% of the results?Keeps it clear and practical

build a skill in 10 days- even from the scratch
"I'm beginner in kubernetes.Design a 10 days roadmap with core principles,short daily actions(30 mn max)
and applied outcomes I can use in real life

**************************************************************************

session 51

kubectl get ns
sudo vim pods.yml=> from documentation
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
---

kubectl apply -f pods.yml
kubectl get pods -n nginx-ns
kubectl describe pod nginx-pod -n nginx-ns

by command line
kubectl run nginx-pod --image=nginx:latest --port -n nginx-ns

pod-smallest unit
same  network ,short leaf unit,k8s recreate

kubectl delete pod name_pod -n nginx-ns

deployment.yml
self healing abilities,replicas,scaling ability,rolling update

sudo vim deployment.yml
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
---
kubectl apply -f deployment.yml
kubectl get pods -n nginx-ns
kubectl get deployment -n nginx-ns

watch kubectl get pods -n nginx-ns

24 se paending hai session 51
