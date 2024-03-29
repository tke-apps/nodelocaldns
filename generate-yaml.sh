#! /bin/bash

kubedns=$(kubectl get svc kube-dns -n kube-system -o jsonpath={.spec.clusterIP})
curl https://raw.githubusercontent.com/kubernetes/kubernetes/master/cluster/addons/dns/nodelocaldns/nodelocaldns.yaml 2>/dev/null |
	sed "s/__PILLAR__LOCAL__DNS__/169.254.20.10/g; s/__PILLAR__DNS__DOMAIN__/cluster.local/g; s/__PILLAR__DNS__SERVER__/$kubedns/g; s/registry\\.k8s\\.io\\/dns/docker.io\\/k8smirror/g" \
		>nodelocaldns.yaml
