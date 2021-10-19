#!/bin/bash

set -euo pipefail

if [[ -z "${LIST_TO_PRINT:-}" ]]; then
  LIST_TO_PRINT=":github:"
fi

echo "Steps:"

for item in $LIST_TO_PRINT; do
    echo "  - label: 'Printing ${item}'"
    echo "    command: 'echo ${item}'"
done
