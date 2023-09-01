# k8s_test_pods

Here is a collection of pod-templates based upon the information in https://developer.izumanetworks.com/docs/device-management-edge/2.6/container/deploying.html   

Assumes that you have ```kubectl``` installed and configured to your account   

## Simple Pod

To deploy the simple test pod to your node:

```
cd simple_pod
./create_pod.sh --node <nodeId> --apply
```

## Looping Pod

To deploy the looping test pod to your node:


```
cd looping_pod
./create_pod.sh --node <nodeId> --apply
```
This will create a yaml file named after the node and with a random element, e.g. test-pod-018a2858a6d3eebee3dfd07000000000-26342.yaml   

The pod will be called test-pod-018a2858a6d3eebee3dfd07000000000-26342

To see the running pods..
```
kubectl get pods
```

To see the logs from the pod..
```
kubectl logs test_test-pod-<node>-<rand>
