⛵ Helm in Kubernetes (Practical + Interview Ready)
1️⃣ What is Helm?
Interview Definition

Helm is the package manager for Kubernetes that helps define, install, upgrade, and manage Kubernetes applications using reusable packages called Helm Charts.

📌 Think of Helm like:

apt for Linux

yum for RHEL

npm for Node.js

But for Kubernetes applications.

2️⃣ Why Helm Is Used (REAL IT PROBLEMS)
Problems Without Helm

Kubernetes apps need multiple YAML files

Deployment

Service

ConfigMap

HPA

PVC

Manual updates are:

Error-prone

Time-consuming

Difficult to roll back

Environment differences (dev, QA, prod)

Helm Solves This By:

✅ Combining multiple YAMLs into one reusable package
✅ Making install / upgrade / rollback very easy
✅ Supporting templating and variables
✅ Managing application versions
✅ Enabling GitOps & CI/CD pipelines

3️⃣ What Is a Helm Chart?
Interview Answer

A Helm Chart is a collection of Kubernetes manifests packaged together with templates and configuration values.

📦 A chart represents one application.

4️⃣ Helm Chart Structure (VERY IMPORTANT)
my-app/
├── Chart.yaml
├── values.yaml
├── templates/
│   ├── deployment.yaml
│   ├── service.yaml
│   ├── hpa.yaml
│   ├── pvc.yaml
│   └── _helpers.tpl
└── charts/

1️⃣ Chart.yaml

📌 Metadata file

apiVersion: v2
name: my-app
version: 1.0.0
description: Helm chart for my application


Contains:

Chart name

Version

Description

App version

2️⃣ values.yaml

📌 Configuration file (most important in real projects)

image:
  repository: nginx
  tag: latest

replicaCount: 2

service:
  type: ClusterIP
  port: 80


💡 This is where environment-specific values go:

Image versions

Replicas

Ports

Resource limits

3️⃣ templates/

📌 Actual Kubernetes YAML files with variables

Example:

replicas: {{ .Values.replicaCount }}
image: {{ .Values.image.repository }}:{{ .Values.image.tag }}


💡 Helm uses Go templating engine.

5️⃣ Helm Release (Key Concept)
Interview Definition

A Helm Release is a running instance of a Helm Chart deployed into a Kubernetes cluster.

📌 Same chart → multiple releases possible
Example:

jenkins-dev

jenkins-prod

6️⃣ Installing Helm (Practical)
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-4
chmod 700 get_helm.sh
./get_helm.sh


Verify:

helm version

7️⃣ Helm Repositories & Artifact Hub
Artifact Hub

Public repository for Helm charts (like Docker Hub for images)

Website: https://artifacthub.io

Add Helm Repo (Jenkins Example)
helm repo add jenkins https://charts.jenkins.io
helm repo list
helm repo update

8️⃣ Real Project Example – Jenkins Installation
Install Jenkins using Helm
helm install jenkins-demo jenkins/jenkins \
  --namespace jenkins-ns \
  --create-namespace

Verify Deployment
kubectl get ns
kubectl get pods -n jenkins-ns
kubectl get svc -n jenkins-ns
kubectl get all -n jenkins-ns

Access Jenkins
kubectl port-forward svc/jenkins-demo 8080:8080 \
  -n jenkins-ns \
  --address=0.0.0.0

Get Jenkins Admin Password
kubectl get secret -n jenkins-ns jenkins-demo \
-o jsonpath="{.data.jenkins-admin-password}" | base64 --decode

9️⃣ Upgrade & Rollback (INTERVIEW GOLD)
Upgrade Release
helm upgrade jenkins-demo jenkins/jenkins -n jenkins-ns

View Release History
helm history jenkins-demo -n jenkins-ns

Rollback to Previous Version
helm rollback jenkins-demo 1 -n jenkins-ns


💡 This is a BIG advantage over plain kubectl.

🔟 Uninstall Helm Release
helm uninstall jenkins-demo -n jenkins-ns


📌 Removes:

Deployment

Service

ConfigMaps

Secrets

1️⃣1️⃣ Helm in CI/CD (Real IT Usage)
Typical Pipeline Flow

Build Docker image

Push image to registry

Update values.yaml

Run:

helm upgrade --install my-app ./chart -n prod

1️⃣2️⃣ Helm vs kubectl (Interview Comparison)
Feature	kubectl	Helm
Manage many YAMLs	❌ Hard	✅ Easy
Versioning	❌ No	✅ Yes
Rollback	❌ No	✅ Yes
Reusability	❌ No	✅ Yes
CI/CD friendly	❌ Limited	✅ Yes
1️⃣3️⃣ Common Interview Questions
Q: Why Helm is preferred in production?

Answer:
Because it supports versioning, rollback, templating, and simplifies complex Kubernetes deployments.

Q: What is the difference between Chart and Release?

Answer:
Chart is a package, Release is a running instance of that package.

Q: Where do environment-specific configs go?

Answer:
values.yaml or separate values files like values-prod.yaml.

1️⃣4️⃣ One-Line Interview Summary

Helm simplifies Kubernetes application deployment by packaging multiple manifests into reusable, versioned charts with easy install, upgrade, and rollback capabilities.


🚀 Helm create Command – Practical + Interview Explanation
1️⃣ Create Namespace
kubectl create ns nginx-app-ns

Why?

Namespaces provide logical isolation

In real projects:

dev

qa

prod

Helm releases are namespace-scoped

📌 Interview line

We deploy Helm charts inside namespaces to isolate environments and manage resources efficiently.

2️⃣ Create a Helm Chart Skeleton
helm create nginx-app

What this command does

Generates a standard Helm chart structure

Saves time (no need to write everything from scratch)

Follows Helm best practices

3️⃣ Verify Files
ls
cd nginx-app
ls


You’ll see:

nginx-app/
├── charts/
├── Chart.yaml
├── templates/
├── values.yaml
├── .helmignore


📌 This structure is standard in production environments.

4️⃣ Understand Each File (VERY IMPORTANT)
📄 Chart.yaml (NOT charts.yml ❌)
cat Chart.yaml

Example content:
apiVersion: v2
name: nginx-app
description: A Helm chart for Kubernetes
type: application
version: 0.1.0
appVersion: "1.16.0"

Explanation (Interview Focus)
Field	Meaning
apiVersion	Helm chart API version
name	Chart name
description	Purpose of the chart
type	application / library
version	Chart version (Helm versioning)
appVersion	App version (Docker image version)

📌 Interview Trick Question
Q: Difference between version and appVersion?
✅ Answer:

version → Helm chart version

appVersion → Application version inside the container

📄 values.yaml (MOST IMPORTANT FILE)
cat values.yaml

Purpose

Holds default configuration values

Used to customize deployments without editing templates

Example:

replicaCount: 1

image:
  repository: nginx
  pullPolicy: IfNotPresent
  tag: ""

service:
  type: ClusterIP
  port: 80


📌 Real IT usage

Different values files:

values-dev.yaml

values-prod.yaml

Used in CI/CD pipelines

📁 templates/ Directory
ls templates/


Contains:

deployment.yaml
service.yaml
hpa.yaml
ingress.yaml
serviceaccount.yaml
_helpers.tpl

What happens here?

Kubernetes YAML files

Uses Go templating

Values come from values.yaml

Example:

replicas: {{ .Values.replicaCount }}


📌 Interview line

Templates allow dynamic configuration of Kubernetes resources using values files.

📁 charts/ Directory
ls charts/

Purpose

Stores dependent Helm charts

Example:

Application depends on Redis, MySQL

📌 Real example:

charts/
└── redis/

📄 .helmignore

Similar to .gitignore

*.tgz
*.bak


Prevents unwanted files from being packaged.

5️⃣ Deploy Helm Chart (Dry Run First – BEST PRACTICE)
helm install nginx-app . \
  --namespace nginx-app-ns \
  --dry-run


📌 Shows rendered Kubernetes YAML without deploying.

6️⃣ Install Helm Chart
helm install nginx-app . \
  --namespace nginx-app-ns

7️⃣ Verify Deployment
kubectl get all -n nginx-app-ns
helm list -n nginx-app-ns

8️⃣ Upgrade the Application (Real Production Scenario)
helm upgrade nginx-app . \
  --namespace nginx-app-ns


📌 Used when:

Image version changes

Replicas updated

Config changes

9️⃣ Rollback (Interview Favorite)
helm history nginx-app -n nginx-app-ns
helm rollback nginx-app 1 -n nginx-app-ns

🔥 Interview Summary (One-Liners)

helm create generates a production-ready chart structure

Chart.yaml = metadata

values.yaml = configuration

templates/ = Kubernetes manifests

release = running instance of a chart

Helm enables versioning, rollback, and reusability

✅ Common Interview Questions

Q: Why use helm create instead of manual YAMLs?
A: It enforces best practices, saves time, and provides a reusable structure.

Q: Where do environment changes go?
A: In values.yaml or separate environment-specific values files.