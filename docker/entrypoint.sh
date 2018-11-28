#!/bin/sh
if [ ! -e /etc/orchestrator.conf.json ] ; then
cat <<EOF > /etc/orchestrator.conf.json
{
  "Debug": true,
  "ListenAddress": ":3000",
  "StatusEndpoint": "/status",
  "MySQLTopologyUser": "${ORC_TOPOLOGY_USER:-orchestrator}",
  "MySQLTopologyPassword": "${ORC_TOPOLOGY_PASSWORD:-orchestrator}",
  "BackendDB": "sqlite",
  "SQLite3DataFile": "/usr/local/orchestrator/orchestrator.db",
  "RaftEnabled": true,
  "RaftDataDir": "/var/lib/orchestrator",
  "RaftBind": "${HOSTNAME}",
  "DefaultRaftPort": 10008,
  "RaftNodes": [
    "orchestrator1",
    "orchestrator2",
    "orchestrator3"
  ],
  "RecoveryPeriodBlockSeconds": 30,
  "RecoveryIgnoreHostnameFilters": [],
  "RecoverMasterClusterFilters": [
    "*"
  ],
  "RecoverIntermediateMasterClusterFilters": [
    "*"
  ],
  "ApplyMySQLPromotionAfterMasterFailover": true,
  "AutoPseudoGTID": true,
  "KVClusterMasterPrefix": "mysql/master",
  "ZkAddress": "zoo1,zoo2,zoo3"
}
EOF
fi

exec /usr/local/orchestrator/orchestrator -debug http
