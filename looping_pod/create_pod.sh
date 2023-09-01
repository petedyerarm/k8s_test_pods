#!/bin/bash

# Parse command line
args_list="apply"
args_list="${args_list},node:"
args_list="${args_list},verbose"

args=$(getopt -o+ho:x -l $args_list -n "$(basename "$0")" -- "$@")

eval set -- "$args"

while [ $# -gt 0 ]; do
    if [ -n "${opt_prev:-}" ]; then
        eval "$opt_prev=\$1"
        opt_prev=
        shift 1
        continue
    elif [ -n "${opt_append:-}" ]; then
        eval "$opt_append=\"\${$opt_append:-} \$1\""
        opt_append=
        shift 1
        continue
    fi
    case $1 in
    --apply)
        apply=y
        ;;
    --node)
        opt_prev=nodeId
        ;;
    --verbose)
        set -x
        ;;
    esac
    shift 1
done

pod_name=test-pod-"$nodeId"-"$RANDOM"


if [ -z "${nodeId:-}" ]; then
    echo "node not specified"
    exit 1
fi

sed -e "s/POD_NAME/$pod_name/" < pod_template.yaml > "$pod_name".yaml
sed -i -e "s/NODE_NAME/$nodeId/" "$pod_name".yaml

echo "Created pod file $pod_name.yaml"

if [ -n "${apply:-}" ]; then
    if [ "$(kubectl get node "$nodeId")" ]; then
        echo "Node exits"
        echo "Deploying pod"
        kubectl apply -f "$pod_name".yaml
    else
        echo "Node $nodeId not found"
    fi
fi
