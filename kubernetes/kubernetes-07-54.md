kubectl get ns
kubectl get pv
kubectl get pvc -n mysql
kubectl get pods -n mysql

kubectl exec -it -n mysql pod-name  --mysql -u root -p 

SHOW DATABASES;
use myDB;
select * from employees;

create table employees(id int auto_increment primary key,name varchar(50),role varchar(50),salary int);

insert into employees (name,role,salary) values('anil','devops-engineer','23232')


exit

kubectl get pods -ns mysql
kubectl delete pod pod_id -n mysql

kubectl delete pod -n mysql --all

kubectl get pods -n myqsl
kubectl exec -it -n mysql pod-id -u root -p

show databases;
use mydb
select * from the employees;


kubectl get pods -n mysql
kubectl describe pod pod-id -n mysql

docker exec -it kind-worker3 bash
cd /mnt/data/mysql
ls
cd mydb
cat employees

//delete data folder
rm -rf /mnt/data/mysql

kubectl get pods -n mysql
kubectl delete pods -n mysql pod_id

kubectl get pods -n mysql

kubectl exec -it -n mysql pod_id --mysql -u root -p
show databases;
use mydb;
select * from employees;


----------------------------------------------------------------
replica sets
