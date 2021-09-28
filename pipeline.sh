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
  - label: "Test 'echo'"
    command: "echo 'Hello BuildKite'"
    agents:
      - *agent_queue

  - wait

  - label: "Test 'gcc'"
    command: "gcc --version"
    agents:
    - *agent_queue

  - wait

  - label: "List '/usr/bin'"
    command: "ls /usr/bin"
    agents:
    - *agent_queue
YML
