# Docker

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

## Building and running only one instance of orchestrator
```
docker-compose up orchestrator1
```

Once orchestrator is running it can be accessed through any of the following URLs:

* http://127.0.0.1:3331/
* http://127.0.0.1:3332/
* http://127.0.0.1:3333/
