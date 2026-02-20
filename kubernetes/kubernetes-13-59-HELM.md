1. CHECK NAMESPACE
kubectl get ns

If not present:

kubectl create ns nginx-app-ns
2. HELM DIRECTORY STRUCTURE (BEST PRACTICE)
nginx-app/
├── Chart.yaml
├── values.yaml
└── templates/
    ├── deployment.yaml
    └── service.yaml

⚠️ Use Chart.yaml and values.yaml (not charts.yml / values.yml)

3. DEPLOYMENT TEMPLATE

templates/deployment.yaml

apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ .Release.Name }}
  namespace: {{ .Release.Namespace }}
  labels:
    app: nginx-app
spec:
  replicas: {{ .Values.replicaCount }}
  selector:
    matchLabels:
      app: nginx-app
  template:
    metadata:
      labels:
        app: nginx-app
    spec:
      containers:
        - name: nginx
          image: "{{ .Values.image.repository }}:{{ .Values.image.tag }}"
          imagePullPolicy: {{ .Values.image.pullPolicy }}
          ports:
            - containerPort: 80
          resources:
            requests:
              cpu: {{ .Values.resources.requests.cpu | quote }}
              memory: {{ .Values.resources.requests.memory | quote }}
            limits:
              cpu: {{ .Values.resources.limits.cpu | quote }}
              memory: {{ .Values.resources.limits.memory | quote }}

✅ Improvements:

Proper quoting for CPU/memory

Clean indentation

Helm-safe templating

4. SERVICE TEMPLATE

templates/service.yaml

apiVersion: v1
kind: Service
metadata:
  name: nginx-svc
  namespace: {{ .Release.Namespace }}
  labels:
    app: nginx-app
spec:
  type: ClusterIP
  selector:
    app: nginx-app
  ports:
    - name: http
      port: 80
      targetPort: 80
      protocol: TCP

✅ Fixed:

Wrong indentation

protocol alignment

Added labels

5. VALUES FILE

values.yaml

replicaCount: 2

image:
  repository: nginx
  tag: "1.25"
  pullPolicy: IfNotPresent

resources:
  requests:
    cpu: "50m"
    memory: "64Mi"
  limits:
    cpu: "200m"
    memory: "128Mi"
6. CHART METADATA

Chart.yaml

apiVersion: v2
name: nginx-app
description: A simple static nginx frontend deployed using Helm
type: application
version: 0.1.0
appVersion: "1.25"

✅ Fixed:

apiVesrion ❌ → apiVersion ✅

appVersio ❌ → appVersion ✅

Added type: application

7. INSTALL HELM RELEASE
helm install nginx-release ./nginx-app -n nginx-app-ns

Verify:

helm list -n nginx-app-ns
kubectl get pods -n nginx-app-ns
kubectl get svc -n nginx-app-ns
8. ACCESS THE APPLICATION
kubectl port-forward svc/nginx-svc \
-n nginx-app-ns \
80:80 \
--address=0.0.0.0

Open in browser:

http://<EC2-PUBLIC-IP>




kubectl get ns

cd helm
cd templates


sudo vim deployment.yml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ .Release.Name }}
  namespace: {{ .Release.Namespace }}
  labels:
    app: nginx-app
spec:
  replicas: {{ .Values.replicaCount }}
  selector:
    matchLabels:
      app: nginx-app
  template:
    metadata:
      labels:
        app: nginx-app
    spec:
      containers:
        - name: nginx
          image: "{{ .Values.image.repository }}:{{ .Values.image.tag }}"
          imagePullPolicy: {{ .Values.image.pullPolicy }}
          ports:
            - containerPort: 80
          resources:
            requests:
              cpu: {{ .Values.resources.requests.cpu }}
              memory: {{ .Values.resources.requests.memory }}
            limits:
              cpu: {{ .Values.resources.limits.cpu }}
              memory: {{ .Values.resources.limits.memory }}

sudo vim service.yml
apiVersion: v1
kind: Service
metadata:
  name: nginx-svc
  namespace: {{.Release.Namespace}}
spec:
  selector:
    app: nginx-app
  ports:
   - name: http
     port: 80
     targetPort: 80
    protocol: TCP
  type: ClusterIP

sudo vim values.yml
replicaCount: 2

image:
  repository: nginx
  tag: "1.25"
  pullPolicy: IfNotPresent

resources:
  requests:
    cpu: "50m"
    memory: "64Mi"
  limits:
    cpu: "200m"
    memory: "128Mi"


sudo vim charts.yml
apiVesrion: v2
name: nginx-app
description: static nginx frontend app deployment using helm
appVersio: "1.0"


helm install nginx-relase ./nginx-app -n nginx-app-ns

sudo -E kubectl port-forward svc/nginx-svc -n nginx-app-ns 80:80 --address=0.0.0.0