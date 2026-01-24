# config map and secrets
# configmaps
all configuration required but not confidentials
environment based value
database name

# secrets
it store sensitive information and confidentials 
base64 encoded value store
token ,api key ,password
echo -n "india" | base64
secure ,mask 

sudo vim namespace.yml
apiVersion: v1
kind: Namespace
metadata:
  name: mysql

kubectl apply -f namespace.yml
kubectl get namespaces

echo -n "Admin@123" | base64
YWRtaW5AMTIz

sudo vim secrets.yml
apiVersion: v1
kind: Secret
metadata:
  name: mysql-secret
  namespace: mysql
type: Opaque
data:
   password: YWRtaW5AMTIz

kubectl apply -f secrets.yml
kubectl get secrets
   
sudo vim configmap.yml
apiVersion: v1
kind: ConfigMap
metadata:
  name: mysql-config
  namespace: mysql
data: 
  database: myDB

kubectl apply -f configmap.yml
kubectl get configmaps

sudo vim deployment.yml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: mysql-dep
  namespace: mysql
spec:
  replicas: 1
  selector:
    matchLabels:
      app: mysql
      version: v1
  template:
    metadata:
      labels:
        app: mysql
        version: v1
    spec:
      securityContext:
        runAsUser: 999
        fsGroup: 999
      containers:
      - name: mysql
        image: mysql:latest
        imagePullPolicy: IfNotPresent
        ports:
        - containerPort: 3306
        env:
          - name: MYSQL_ROOT_PASSWORD
            valueFrom:
              secretKeyRef:
                name: mysql-secret
                key: password

          - name: MYSQL_DATABASE
            valueFrom:
              configMapKeyRef:
                name: mysql-config
                key: database



kubectl apply -f deployment.yml
kubectl get deployments


kubectl get all -n mysql

kubectl get pods -n mysql
kubectl get configmap -n mysql
kubectl get secrets -n mysql
kubectl get deployment -n mysql

sudo vim service.yml
apiVersion: v1
kind: Service
metadata:
  name: mysql-service
  namespace: mysql
spec:
  selector:
    app: mysql
  ports:
    - protocol: TCP
      port: 3306        # Cluster port
      targetPort: 3306  # Container port
  type: ClusterIP


kubectl apply -f service.yml
kubectl get service -n mysql

kubectl get pods -n mysql
kubectl get service

kubectl logs pod-name -n mysql

 kubectl exec -it -n mysql mysql-dep-7dd9454fd8-kd8lh -- mysql -u root -p

SHOW DATABASES;
mydb display
 