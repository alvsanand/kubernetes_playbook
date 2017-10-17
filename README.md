# kubernetes_playbook

## General

## Postgres server

### Persisten Volume

```
sudo mkdir -p /var/nfs/postgres

kubectl create -f postgres/postgres_volume.yaml

kubectl get pv postgres-volume
```

## Postgres Volume Claim

```
kubectl create -f postgres/postgres_volume_claim.yaml

kubectl get pvc postgres-claim
```

## Postgres Pod

```
kubectl create -f postgres/postgres.yaml

kubectl get pod postgres-pod
```