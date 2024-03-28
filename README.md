# NodeLocalDNS

在 TKE 上的 DNS 缓存组件，仅用于 GlobalRouter 网络模式的集群，且 kube-proxy 是 IVPS 模式，其它场景可直接安装 TKE 官方的 [NodeLocalDNSCache 插件](https://cloud.tencent.com/document/product/457/49423)。

## 前提条件

1. 集群网络模式为 GlobalRouter。
2. kube-proxy 的模式为 IVPS。
3. 配置好了 TKE 集群的 kubeconfig，可以用 [kubectl](kubednsIphttps://kustomize.io/) 操作 TKE 集群。
4. 安装了 [helm](https://helm.sh/) 和 [kustomize](https://kustomize.io/)。

## 安装方法

```bash
git clone --depth 1 https://github.com/tke-apps/nodelocaldns.git
cd nodelocaldns
make
```

## 关于版本

本项目所使用的 NodeLocalDNS addon 的 YAML 是 Kubernetes [官方提供的 YAML](https://raw.githubusercontent.com/kubernetes/kubernetes/master/cluster/addons/dns/nodelocaldns/nodelocaldns.yaml) 自动替换生成的，实时保持最新版本。
