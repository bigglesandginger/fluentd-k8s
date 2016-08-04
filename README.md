# Kubernetes Fluentd + Elastic Search

Alpha quality, use at your own risk.

## How to use

Modify `fluentd-daemonset.yaml` as necessary, then run the following:

```
kubectl create -f fluentd-daemonset.yaml
```

## How it works

`fluent.conf` has Fluentd reading from `/var/lib/docker/containers` and looking up the container metadata from `containers/<id>/config.v2.json`.

`fluentd-daemonset.yaml` has the fluentd-k8s instances reading ES config from environment variables, set up via Kubernetes secrets. Make sure the secrets are set up before provisioning.
