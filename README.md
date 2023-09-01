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

To deploy the simple test pod to your node:

```
cd looping_pod
./create_pod.sh --node <nodeId> --apply
```
