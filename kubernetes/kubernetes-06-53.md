🗄️ Kubernetes Persistent Volume (PV) & Persistent Volume Claim (PVC)

(Interview-Oriented + Hands-On Explanation)

1️⃣ What is Persistent Volume (PV)?
Definition (Interview Answer)

A PersistentVolume (PV) is a cluster-level storage resource provisioned by an administrator and used to store data independent of pod lifecycle.

✔ PV exists even if pods are deleted
✔ Not tied to any namespace
✔ Represents actual storage (disk, NFS, cloud disk, etc.)

2️⃣ What is Persistent Volume Claim (PVC)?
Definition (Interview Answer)

A PersistentVolumeClaim (PVC) is a request for storage made by a user/application.

✔ PVC is namespace-scoped
✔ It requests:

Storage size

Access mode

Storage class

👉 Kubernetes binds PVC to a matching PV automatically

3️⃣ Why do we need PV & PVC? (VERY IMPORTANT)
Problem Without PV/PVC

Pod storage is ephemeral

Pod delete = data loss

Solution with PV & PVC

Storage survives:

Pod restart

Pod deletion

Node failure (depending on backend)

Interview One-Liner

PV and PVC decouple storage from pods, making applications stateful and reliable.

4️⃣ Access Modes (Interview Must-Know)
Access Mode	Meaning	Example
ReadWriteOnce (RWO)	Mounted by one node	MySQL, PostgreSQL
ReadOnlyMany (ROX)	Read-only by many	Config data
ReadWriteMany (RWX)	Read-write by many	NFS, EFS
5️⃣ PV Reclaim Policy (Very Important)
Policy	Behavior
Retain	Data stays after PVC deletion
Delete	Data deleted automatically
Recycle	Old (deprecated)

👉 Databases usually use Retain

6️⃣ Create Persistent Volume (PV)
YAML: pv.yml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: mysql-pv
spec:
  capacity:
    storage: 10Gi
  accessModes:
    - ReadWriteOnce
  storageClassName: local-path
  persistentVolumeReclaimPolicy: Retain
  hostPath:
    path: /mnt/data/mysql
    type: DirectoryOrCreate

Apply & Verify
kubectl apply -f pv.yml
kubectl get pv

Interview Insight

hostPath is used for learning. In production, we use EBS, EFS, Azure Disk, NFS.

7️⃣ Create Persistent Volume Claim (PVC)
YAML: pvc.yml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: mysql-pvc
  namespace: mysql
spec:
  accessModes:
    - ReadWriteOnce
  storageClassName: local-path
  resources:
    requests:
      storage: 10Gi

Apply & Verify
kubectl apply -f pvc.yml
kubectl get pvc -n mysql


👉 At this point:

PVC status becomes Bound

PV is attached to PVC

8️⃣ PVC Binding Logic (Interview Gold 🥇)

PVC binds to PV if:

Storage size ≥ requested

Same access mode

Same storageClassName

PV is Available

9️⃣ Using PVC in Deployment (MySQL Example)
Deployment uses PVC
volumes:
  - name: mysql-storage
    persistentVolumeClaim:
      claimName: mysql-pvc

volumeMounts:
  - mountPath: /var/lib/mysql
    name: mysql-storage

Apply Deployment
kubectl apply -f deployment.yml
kubectl get pods -n mysql

🔟 Verify Data Persistence (Hands-On Proof)
Access MySQL
kubectl exec -it -n mysql pod-name -- mysql -u root -p

CREATE DATABASE mydb;
USE mydb;

CREATE TABLE employees (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50),
  role VARCHAR(50),
  salary INT
);

INSERT INTO employees VALUES (1,'Anil','DevOps Engineer',23232);


Exit MySQL.

1️⃣1️⃣ Delete Pod & Validate Persistence
kubectl delete pod -n mysql pod-name
kubectl get pods -n mysql


👉 New pod starts
👉 Data still exists

kubectl exec -it -n mysql new-pod -- mysql -u root -p

USE mydb;
SELECT * FROM employees;


✔ Data is intact

1️⃣2️⃣ Verify PV & PVC Details
kubectl describe pv mysql-pv
kubectl describe pvc mysql-pvc -n mysql

1️⃣3️⃣ Where is Data Stored? (Node Level)
docker exec -it kind-worker bash
cd /mnt/data/mysql
ls


✔ Actual MySQL files are stored here

1️⃣4️⃣ Interview Question: What if node storage is deleted?
rm -rf /mnt/data/mysql


👉 Pod restarts
👉 Data lost ❌ (hostPath limitation)

Interview Answer

hostPath is not production-ready. Use cloud storage for HA.

1️⃣5️⃣ PV vs PVC (Interview Table)
Feature	PV	PVC
Scope	Cluster	Namespace
Created by	Admin	User/App
Represents	Storage	Request
Lifecycle	Independent	App-dependent
1️⃣6️⃣ Dynamic vs Static Provisioning
Type	Description
Static	Admin creates PV manually
Dynamic	StorageClass auto-creates PV
1️⃣7️⃣ One-Line Interview Summary

PV provides physical storage, PVC is a logical request, and Kubernetes binds them to provide persistent data for pods.