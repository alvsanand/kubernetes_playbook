# kubernetes_playbook

## General

### Setup Docker environment

```
eval $(minikube docker-env)
```

### Configure NFS server

```
sudo mkdir -p /var/nfs

sudo chown -R nobody:nogroup /var/nfs
sudo chmod -R a+rX  /var/nfs

echo "/var/nfs 192.168.0.0/16(rw,no_root_squash,no_subtree_check)" >> /etc/exports

sudo systemctl restart nfs-server
```

### Run busybox pod

```
kubectl create -f busybox.yaml

kubectl exec -ti busybox -- echo "TEST"
```

## Postgres server

### Persisten Volume

```
sudo mkdir -p /var/nfs/postgres

kubectl create -f postgres/postgres-volume.yaml

kubectl get pv postgres-volume
```

## Postgres Volume Claim

```
kubectl create -f postgres/postgres-volume-claim.yaml

kubectl get pvc postgres-claim
```

## Postgres Pod

```
kubectl create -f postgres/postgres.yaml

kubectl get pod postgres-pod
```

## Postgres Service

```
kubectl create -f postgres/postgres-service.yaml

kubectl get service postgres-service

# Check DNS
kubectl exec -ti busybox -- nslookup postgres-service.default
```

## Postgres populator

### Create Image

```
docker build -t postgres-populator:1.0.0 postgres-populator/
```

## Postgres Job

```
kubectl create -f postgres-populator/postgres-populator.yaml

kubectl get job postgres-populator-job
```