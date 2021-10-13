#!/bin/bash

set -euo pipefail

if [[ -z "${BUILDKITE_QUEUE:-}" ]]; then
  BUILDKITE_QUEUE="kubernetes"
fi

cat << YML
---
agents:
  queue: "${BUILDKITE_QUEUE}"
agent_queue: &agent_queue "queue=${BUILDKITE_QUEUE}"

steps:
  - label: "Workload 1"
    command: "echo 'Executing workload 1' && sleep 100 && echo 'Done with workload 1'"
    agents:
      - *agent_queue

  - label: "Workload 2"
    command: "echo 'Executing workload 2' && sleep 100 && echo 'Done with workload 2'"
    agents:
      - *agent_queue
  
  - label: "Workload 3"
    command: "echo 'Executing workload 3' && sleep 100 && echo 'Done with workload 3'"
    agents:
      - *agent_queue
  
  - label: "Workload 4"
    command: "echo 'Executing workload 4' && sleep 100 && echo 'Done with workload 4'"
    agents:
      - *agent_queue
  
  - label: "Workload 5"
    command: "echo 'Executing workload 5' && sleep 100 && echo 'Done with workload 5'"
    agents:
      - *agent_queue
YML
