# Kubectl Cheat Sheet

## Inspect Cluster
kubectl get nodes
kubectl get pods -A
kubectl get svc

## Inspect Resource
kubectl describe pod <pod-name>
kubectl logs <pod-name>
kubectl get events

## Apply / Delete YAML
kubectl apply -f <file.yaml>
kubectl delete -f <file.yaml>

## Scaling
kubectl scale deploy <deployment-name> --replicas=<count>

## Resources Usage
kubectl top pods
kubectl top nodes