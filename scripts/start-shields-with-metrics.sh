#!/bin/sh

cd shields

export METRICS_PROMETHEUS_ENABLED=true
export METRICS_INFLUX_ENABLED=TRUE
export METRICS_INFLUX_URL=http://127.0.0.1:8081/telegraf
export METRICS_INFLUX_INSTANCE_ID_FROM=random
export METRICS_INFLUX_ENV_LABEL=local
export INFLUX_USERNAME=telegraf
export INFLUX_PASSWORD=telegrafpass
export METRICS_PROMETHEUS_ENDPOINT_ENABLED=true

npm start
