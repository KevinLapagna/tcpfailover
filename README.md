# tcpfailover
This is a project for setting up an HAProxy for TCP service failover within OpenShift

# Dockerfile
The Dockerfile can be used to build a container based on ubi9 with an an installed HAProxy v2.* inside.
# Helm Chart
This helm sets up
- a BuildConfig to build the above mentioned HAProxy container
- a Deployment with that container
- Services and Routes to make this container accessible from the outside

The defaults can be seend and changed in [values.yaml](helm/tcpfailover/values.yaml).

After cloning the repository, you can install the Helm Chart with

```# helm install --create-namespace -n <yournamespace> <yourapplicationname> helm/tcpfailover```

