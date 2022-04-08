[root@k8s-master1 ops-czm]# cat 220307-consul.history
  780  cd /home/
  781  ls
  782  ll
  783  mkdir ops-czm
  784  cd ops-czm/
  785  ls
  786  wget https://get.helm.sh/helm-v3.6.3-linux-amd64.tar.gz
  787  ll
  788  tar -zxvf helm-v3.6.3-linux-amd64.tar.gz
  789  ll
  790  cd linux-amd64/
  791  ls
  792  cp helm /usr/local/bin/helm
  793  cd /
  794  helm
  795  helm repo add hashicorp https://helm.releases.hashicorp.com
  796  helm search repo hashicorp/consul
  797  kubectl get namespace
  798  helm install consul hashicorp/consul --set global.name=consul --create-namespace -n consul
  799  cd
  800  ls
  801  cd .kube/
  802  ls
  803  ll
  804  cat config
  805  iptables -S
  806  netstat -ano |grep 8443
  807  docker search nfs-client-provisioner
  808  docker pull vbouchaud/nfs-client-provisioner
  809  docker images
  810  docker ps
  811  docker tag vbouchaud/nfs-client-provisioner:latest local.harbor/test/nfs-client-provisioner:1.0.0
  812  docker push local.harbor/test/nfs-client-provisioner:1.0.0
  813  docker login local.harbor
  814  docker push local.harbor/test/nfs-client-provisioner:1.0.0
  815  showmount -e 10.43.10.40
  816  cd /home/ops-czm
  817  ls
  818  vim nfs-client-provisioner
  819  mv nfs-client-provisioner nfs-client-provisioner.yaml
  820  vim nfs-client-provisioner.yaml
  821  docker images
  822  vim nfs-client-provisioner.yaml
  823  ll
  824  kubectl apply -f nfs-client-provisioner.yaml
  825  kubectl get pod
  826  ll
  827  vim nfs-client-provisioner.yaml
  828  cd /home/ops-czm/
  829  ls
  830  vim nfs-client-provisioner.yaml
  831  vim rabc-nfsClientProvisioner.yaml
  832  vim rabc-nfsClientProvisioner
  833  mv rabc-nfsClientProvisioner rabc-nfsClientProvisioner.yaml
  834  ll
  835  kubectl apply -f rabc-nfsClientProvisioner.yaml
  836  vim rabc-nfsClientProvisioner.yaml
  837  kubectl apply -f rabc-nfsClientProvisioner.yaml
  838  ll
  839  vim storageclass.yaml
  840  kubectl apply -f storageclass.yaml
  841  history
  842  helm install consul hashicorp/consul --set global.name=consul --create-namespace -n consul
  843  helm install consul hashicorp/consul --set global.name=consul -n consul
  844  helm list
  845  helm ls --all-namespaces
  846  history
  847  helm ls --all-namespaces
  848  helm
  849  helm ls --all-namespaces
  850  helm uninstall consul --all-namespaces
  851  helm uninstall consul
  852  helm uninstall consul -n consul
  853  helm install consul hashicorp/consul --set global.name=consul -n consul
  854  cd /home/
  855  ls
  856  cd ops-czm/
  857  ls
  858  ll
  859  cat storageclass.yaml
  860  kubectl apply -f storageclass.yaml
  861  kubectl get statefulset
  862  kubectl get statefulset -n consul
  863  kubectl get statefulset -n consul consul-server -o yaml
  864  kubectl get statefulset -n consul consul-server -o yaml>consule-statefulset.yaml
  865  vim consule-statefulset.yaml
  866  kubectl apply -f consule-statefulset.yaml
  867  helm inspect values hashicorp/consul
  868  helm inspect values hashicorp/consul>1.txt
  869  vim 1.txt
  870  vim config.yaml
  871  history
  872  helm uninstall consul -n consul
  873  ll
  874  helm install consul hashicorp/consul --create-namespace -n consul -f config.yaml
  875  history
  876  helm uninstall consul -n consul
  877  helm fetch hashicorp/consul
  878  ls
  879  ll
  880  tar -zxvf consul-0.39.0.tgz
  881  ls
  882  cd consul/
  883  ls
  884  ll
  885  cd templates/
  886  ls
  887  vim server-statefulset.yaml
  888  ll
  889  ls
  890  ls |grep deploy
  891  history
  892  helm install consul hashicorp/consul --set global.name=consul -n consul
  893  pwd
  894  ll
  895  ls
  896  vim client-daemonset.yaml
  897  vi server-statefulset.yaml
  898  cd ..
  899  ls
  900  vi values.yaml
  901  vi consul.yml
  902  vi values.yaml
  903  vim values.yaml
  904  cd ..
  905  ls
  906  cat storageclass.yaml
  907  vim config.yaml
  908  history
  909  helm uninstall consul -n consul
  910  helm install consul hashicorp/consul --create-namespace -n consul -f config.yaml
  911  vim config.yaml
  912  netstat -ano |grep 8500
  913  kubectl port-forward service/consul-consul-ui -n consul 80:31019
  914  kubectl port-forward service/consul-consul-ui -n consul 31019:80
  915  netstat -ano |grep 31019
  916  kubectl port-forward service/consul-consul-server -n consul 8500:8500
  917  kubectl port-forward service/consul-consul-ui -n consul 31019:80 --address 0.0.0.0
  918  netstat -ano|grep 31019
  919  kubectl port-forward service/consul-consul-ui -n consul 31019:80 --address 0.0.0.0 &
  920  ps
  921  ps -ef |grep 130228
  922  ps -ef
  923  ps -ef |grep port-forward
  924  history
  925  helm install consul hashicorp/consul --set global.name=consul -n consul
  926  helm install consul hashicorp/consul -n consul
  927  ps -ef |grep port-forward
  928  kubectl port-forward service/consul-consul-ui -n consul 31019:80 --address 0.0.0.0 &
  929  ps -ef |grep port-forward
  930  cd ./kube/
  931  ls
  932  cd .kube/
  933  ls
  934  ll
  935  cat config
  936  kubectl get secret
  937  kubectl get secret -A
  938  kubectl describe secret dashboard-admin-token-pj9rj -n kubernetes-dashboard
  939  kubectl describe secret kubernetes-dashboard-token-mjxrg -n kubernetes-dashboard
  940  kubectl describe secret default-token-ppwft -n kubernetes-dashboard
  941  history
  942   kubectl describe secret kubernetes-dashboard-token-mjxrg -n kubernetes-dashboard
  943  history
  944  ls
  945  kubectl describe sckeepalive
  946  kubectl get pod -o wide
  947  curl 10.43.10.3
  948  curl 10.43.10.3:7788
  949  curl 10.43.10.3:7788/socket/clientCount
  950  ulimit -a
  951  ulimit -i unlimited
  952  ulimit -a
  953  ulimit -l unlimited
  954  vi /etc/security/limits.conf
  955  ulimit -l unlimited
  956  vi /etc/security/limits.conf
  957  top
  958  vi /etc/security/limits.conf
  959  source /etc/security/limits.conf
  960  cd /
  961  ll
  962  cd /home
  963  ls
  964  su root
  965  vim /etc/sysconfig/network-scripts/ifcfg-ens192
  966  history

[root@k8s-master1 ops-czm]#
