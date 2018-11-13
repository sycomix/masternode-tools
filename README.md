# masternode-tools
shell scripts for monitoring my masternodes

## Setup
1. You need to export system/profile env variable
```export DATADOG_API_KEY=<YOUR_DATADOG_API_HERE>```

2. clone this repo into `<YOUR_DIR>`, for example `/usr/local/src`
3. link `ddhelper.sh` into /usr/local/bin with
```
cd /usr/local/bin
ln -s <YOUR_DIR>/masternode-tools/ddhelper.sh
```

## How to use the datadog helper function `sentMetric()`

```
source /usr/local/bin/ddhelper.sh

sentMetric $host $coin $metricname $value $role
```