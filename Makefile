all: update-chart generate-values install

generate-values:
	echo "kubednsIp: $(kubectl get svc kube-dns -n kube-system -o jsonpath={.spec.clusterIP})" > values.yaml

install: generate-values
	kustomize build --enable-helm . | kubectl apply -f -

update-chart:
	curl https://raw.githubusercontent.com/kubernetes/kubernetes/master/cluster/addons/dns/nodelocaldns/nodelocaldns.yaml 2>/dev/null \
		| sed 's/__PILLAR__LOCAL__DNS__/{{ .Values.localdnsIp }}/g; s/__PILLAR__DNS__DOMAIN__/{{ .Values.clusterDomain }}/g; s/__PILLAR__DNS__SERVER__/{{ .Values.kubednsIp }}/g; s/registry\.k8s\.io\/dns/docker.io\/k8smirror/g' \
		> charts/nodelocaldns/templates/nodelocaldns.yaml
