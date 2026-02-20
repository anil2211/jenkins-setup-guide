# Kubernetes Zero to Hero 🚀

> Master Kubernetes fast using the **80/20 rule**: Learn the 20% that gives 80% of the results.

---

## 0️⃣ Docker Confusion (Industry Reality)

❌ Docker alone is **NOT enough in production**.

Docker is just a **container engine**:

- ✅ Builds images  
- ✅ Runs containers  
- ✅ Packages applications consistently  

### Why Docker Alone Fails in Industry
| Problem | Why Docker Fails |
|---------|----------------|
| Scaling | Manual start/stop of containers |
| Load balancing | No service discovery or LB |
| Self-healing | Dead containers stay dead |
| High availability | No auto-rescheduling |
| Security | Weak isolation, manual secrets |
| Monitoring & logging | No observability |
| Rolling updates | Downtime-prone |
| Multi-node management | Very hard |

💡 **Takeaway:**  
Docker = engine  
Kubernetes = production orchestration system  

> Industry never runs Docker alone.

---

## 1️⃣ Why Kubernetes Exists

Kubernetes solves production challenges:

- **Orchestration** → automatic deployment, scaling, healing  
- **Automation** → CI/CD-friendly  
- **Reliability** → self-healing & rolling updates  
- **Scalability** → scale horizontally or vertically  

Maintained by **CNCF**, backed by **Google, AWS, Azure, RedHat** → industry standard.

---

## 2️⃣ Kubernetes 80/20: Must-Know Concepts

If you master these, you understand **80% of Kubernetes in real jobs**:

- Architecture (mental model)  
- Deployment → Pod → Service  
- Ingress  
- ConfigMap & Secret  
- Resource requests & limits  
- Liveness & Readiness probes  
- PVC (Persistent Storage)  
- HPA (Horizontal Pod Autoscaler)  
- Debugging via `kubectl`  

---

## 3️⃣ Architecture (Mental Model)

### Control Plane = Brain
| Component | Role |
|-----------|------|
| API Server | Entry point; validates & updates desired state |
| Scheduler | Decides which node Pods run on |
| Controller Manager | Ensures actual state = desired state |
| etcd | Stores cluster state |

> 🔑 Interview Gold: *If API Server is down → cluster control is down.*

### Worker Node = Muscle
| Component | Role |
|-----------|------|
| kubelet | Runs Pods, talks to API server |
| kube-proxy | Handles service networking & routing |
| Container Runtime | Runs containers (Docker/containerd) |
| Pod | Smallest deployable unit, ephemeral |

❌ `kubectl` is **client-side**, not cluster component.

---

## 4️⃣ Core Flow (Most Important Concept)

```text
Deployment → ReplicaSet → Pod → Container
                        ↓
                     Service

Deployment → manages Pods

ReplicaSet → ensures desired # of Pods

Pod → smallest unit (1+ containers)

Service → exposes Pods reliably

Master this flow → you understand 70% of Kubernetes.

5️⃣ Deployment (Industry Daily Usage)

Used for: APIs, microservices, web apps

Production-Ready Deployment Example
apiVersion: apps/v1
kind: Deployment
metadata:
  name: backend
spec:
  replicas: 3
  selector:
    matchLabels:
      app: backend
  template:
    metadata:
      labels:
        app: backend
    spec:
      containers:
      - name: backend
        image: myrepo/backend:v1
        ports:
        - containerPort: 8080
        resources:
          requests:
            cpu: "200m"
            memory: "256Mi"
          limits:
            cpu: "500m"
            memory: "512Mi"
        readinessProbe:
          httpGet:
            path: /health
            port: 8080
        livenessProbe:
          httpGet:
            path: /health
            port: 8080

✅ Industry Rules:

Always define resource requests/limits

Always define readiness/liveness probes

6️⃣ Service (Stable Networking)

Solves: Pod IP change + load balancing + stable access

Type	Usage
ClusterIP	Internal communication
NodePort	Testing
LoadBalancer	Production cloud
Example
apiVersion: v1
kind: Service
metadata:
  name: backend-svc
spec:
  type: ClusterIP
  selector:
    app: backend
  ports:
    - port: 80
      targetPort: 8080

Pods may die/change IP, Service stays consistent.

7️⃣ Ingress (Production Routing)

Routes domain traffic to Services

Supports HTTPS, multiple apps behind one IP

Example
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: app-ingress
spec:
  rules:
  - host: myapp.com
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: backend-svc
            port:
              number: 80

Industry stack: LoadBalancer + Ingress Controller (NGINX, Traefik)

8️⃣ ConfigMap & Secret
ConfigMap
apiVersion: v1
kind: ConfigMap
metadata:
  name: app-config
data:
  APP_ENV: production
Secret
apiVersion: v1
kind: Secret
metadata:
  name: db-secret
type: Opaque
data:
  password: bXlwYXNzd29yZA==

Use via env.valueFrom in Deployment.
Q: Why not hardcode secrets? → Security + portability + environment separation

9️⃣ Resource Requests & Limits

Requests → scheduler decides placement

Limits → prevent resource abuse

⚠️ If undefined:

Pods may starve

Nodes may overload

Q: What happens if container exceeds memory limit? → OOMKilled

🔟 Liveness vs Readiness Probes
Probe	Purpose
Readiness	Controls traffic routing
Liveness	Restarts unhealthy container

Readiness fail → removed from Service

Liveness fail → container restarted

1️⃣1️⃣ PVC (Persistent Volume Claims)

Used for databases/stateful apps

Stateless apps → Deployment

Stateful apps → StatefulSet

apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: db-pvc
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi
1️⃣2️⃣ Horizontal Pod Autoscaler (HPA)

Automatically scales Pods based on metrics

Requires Metrics Server + CPU requests

apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: backend-hpa
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: backend
  minReplicas: 2
  maxReplicas: 10
  metrics:
  - type: Resource
    resource:
      name: cpu
      target:
        type: Utilization
        averageUtilization: 60
1️⃣3️⃣ Debugging Using kubectl

Commands to memorize:

kubectl get nodes
kubectl get pods -A
kubectl describe pod <pod-name>
kubectl logs <pod-name>
kubectl get svc
kubectl get events
kubectl top pods
kubectl apply -f <file.yaml>
kubectl delete -f <file.yaml>

Debugging Order:

Status

Events

Logs

Resource usage

Labels/selectors

1️⃣4️⃣ Scenario-Based Interview Questions

Scenario 1: Pod CrashLoopBackOff

Check logs

Check env variables

Check image

Check memory/cpu limits

Scenario 2: Service Not Accessible

Check labels

Check endpoints

Check targetPort vs containerPort

Check readiness probe

Scenario 3: High Traffic, App Slow

Check HPA

Check CPU/memory

Scale deployment

Check DB bottleneck                     


kubernetes-cheatsheet/
│
├── README.md                   # Overview, tips, 80/20 focus
├── 01-deployments/
│   ├── deployment-basic.yaml
│   ├── deployment-with-probes.yaml
│   ├── deployment-with-resources.yaml
├── 02-services/
│   ├── service-clusterip.yaml
│   ├── service-nodeport.yaml
│   ├── service-loadbalancer.yaml
├── 03-ingress/
│   ├── ingress-basic.yaml
├── 04-config-secret/
│   ├── configmap.yaml
│   ├── secret.yaml
├── 05-storage/
│   ├── pvc.yaml
├── 06-autoscaling/
│   ├── hpa.yaml
├── 07-debugging/
│   ├── kubectl-commands.md
│   ├── scenario-questions.md