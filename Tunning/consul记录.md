# k8s集群中的consul 恢复 raft-3
- 参考官方文档：https://learn.hashicorp.com/tutorials/consul/recovery-outage#manual-recovery-using-peers-json
- peers.json存放位置： /consul/data/raft/peer.json
- k8s consul 重启步骤：在三个节点上先创建peers.json,然后执行consul leave，pod会重启，但IP不会改变。
```shell script
#三个节点报错一致
[WARN]  agent: bootstrap_expect > 0: expecting 3 servers                                                                                                                                               
[WARN]  agent.auto_config: bootstrap_expect > 0: expecting 3 servers                                                                                                                                   
[INFO]  agent.server: found peers.json file, recovering Raft configuration...                                                                                                                          
[INFO]  agent.server: shutting down server                                                                                                                                                             
[ERROR] agent: Error starting agent: error="Failed to start Consul server: Failed to start Raft: recovery failed: refused to recover cluster with no initial state, this is probably an operator error"
[INFO]  agent: Exit code: code=1                                                                                                                                                                       
```
- 查看consul节点的id 用cat命令：
- 查看raft协议版本用consul info