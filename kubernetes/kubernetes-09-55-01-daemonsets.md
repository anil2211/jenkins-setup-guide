1️⃣ What is a DaemonSet?
Interview Definition (Strong Answer)

A DaemonSet ensures that one copy of a Pod runs on every node (or selected nodes) in a Kubernetes cluster.

✔ Automatically runs pods on:
All worker nodes
New nodes when they join the cluster
Selected nodes using labels/taints
✔ Pods are deleted automatically when node is removed

2️⃣ Why DaemonSet is Required?
Problem Without DaemonSet
You want a background service on every node
Deployment/ReplicaSet cannot guarantee one pod per node

Solution
DaemonSet guarantees node-level services

3️⃣ Common Real-World Use Cases (VERY IMPORTANT)
Use Case	Tool Example
Log collection	Fluentd, Filebeat
Monitoring agents	Prometheus Node Exporter
Networking	kube-proxy, Calico
Security	Falco, antivirus
Storage	CSI node plugins
Interview One-Liner

DaemonSets are mainly used for node-level background processes.

4️⃣ Cluster Requirement for DaemonSet

❌ Master node not required to run pods by default
✔ DaemonSet runs on worker nodes

Control plane nodes usually have taints, so DaemonSet pods don’t run there unless tolerations are added.

5️⃣ Key Characteristics (Interview Gold)
Feature	DaemonSet
Pod count	Equals number of nodes
Scheduling	One pod per node
Scaling	Automatic (node-based)
Use case	Background agents
6️⃣ Folder Setup (Best Practice)
mkdir daemonset
cd daemonset


8️⃣ Final Correct YAML: nginx-daemon.yml
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: nginx-daemon
  namespace: default
spec:
  selector:
    matchLabels:
      app: nginx-daemon
  template:
    metadata:
      labels:
        app: nginx-daemon
    spec:
      containers:
        - name: nginx
          image: nginx:latest
          ports:
            - containerPort: 80

9️⃣ Deploy the DaemonSet
kubectl apply -f nginx-daemon.yml

🔟 Verify DaemonSet Behavior
Check DaemonSet
kubectl get daemonset

Check Nodes
kubectl get nodes

Check Pods (IMPORTANT)
kubectl get pods -o wide


👉 Output shows:
One pod per node
Each pod scheduled on a different node
1️⃣1️⃣ Add a New Node (Live Project Scenario)
👉 When a new worker node joins:
DaemonSet automatically creates a pod
No manual action needed
Interview Line
DaemonSet reacts to cluster topology changes automatically.

1️⃣2️⃣ Delete a DaemonSet
kubectl delete daemonset nginx-daemon

✔ All DaemonSet pods are deleted automatically

1️⃣3️⃣ DaemonSet vs Deployment (INTERVIEW TABLE)
Feature	DaemonSet	Deployment
Pod placement	One per node	Anywhere
Scaling	Node-based	Replica-based
Use case	Background services	Applications
Scheduler	Controlled by DaemonSet	Default scheduler
1️⃣4️⃣ DaemonSet with Node Selector (Advanced)

Run DaemonSet only on specific nodes:

spec:
  template:
    spec:
      nodeSelector:
        role: logging


✔ Used in production logging setups

1️⃣5️⃣ DaemonSet with Tolerations (Control Plane)

To run on master/control-plane nodes:

tolerations:
- key: node-role.kubernetes.io/control-plane
  operator: Exists
  effect: NoSchedule


👉 Interviewers LOVE this answer.

1️⃣6️⃣ Live Project Example (Production)
Logging Stack

DaemonSet: Fluentd

Deployment: Elasticsearch

Deployment: Kibana

👉 Fluentd runs on every node and ships logs centrally.

1️⃣7️⃣ Common Interview Questions & Answers
Q1: Can DaemonSet be scaled manually?

Answer:
❌ No. It scales automatically based on node count.

Q2: What happens if a pod crashes?

Answer:
DaemonSet recreates the pod on the same node.

Q3: Can DaemonSet use PVC?

Answer:
Yes, but usually uses hostPath for node-level access.

Q4: Does DaemonSet use ReplicaSet?

Answer:
❌ No. DaemonSet directly manages pods.

1️⃣8️⃣ One-Line Interview Summary (FINAL)

DaemonSet ensures exactly one pod per node and is mainly used for logging, monitoring, networking, and security agents.