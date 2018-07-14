# Orchestrator on Raft

## Building and running full testing cluster
```
docker-compose up
```
This will bring up one MySQL master and three replicas
along side three orchestrator nodes in HA (Raft)

```
db1_master:3306    [0s,ok,5.7.22-log,rw,ROW,P-GTID]
+ db2_replica:3306 [0s,ok,5.7.22-log,rw,ROW,>>,P-GTID]
+ db3_replica:3306 [0s,ok,5.7.22-log,rw,ROW,>>,P-GTID]
+ db4_replica:3306 [0s,ok,5.7.22-log,rw,ROW,>>,P-GTID]
```

![Orchestrator on Raft screenshot](assets/orchestrator_raft_screenshot.png)

## Building and running only one instance of orchestrator
```
docker-compose up orchestrator1
```

Once orchestrator and haproxy is running it can be accessed through the following URL.

* http://127.0.0.1:8080

This will only proxy to the current Raft leader
