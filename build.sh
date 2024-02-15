#!/bin/bash
source /app/buildpiper/shell-functions/functions.sh
source /app/buildpiper/shell-functions/log-functions.sh


CODEBASE_LOCATION="${WORKSPACE}"/"${CODEBASE_DIR}"
logInfoMessage "I'll do processing at [$CODEBASE_LOCATION]"
cd "${CODEBASE_LOCATION}"
if [ -d "reports" ]; then
    true
else
    mkdir reports
fi
STATUS=0

logInfoMessage "Scanning the code available at ${CODEBASE_LOCATION}"
sleep  "$SLEEP_DURATION"
logInfoMessage "Executing command"
logInfoMessage "pylint --output-format=${FORMAT_ARG} ${CODEBASE_LOCATION}"
pylint --output-format="${FORMAT_ARG}" "${CODEBASE_LOCATION}"

pylint --output-format=json "${CODEBASE_LOCATION}" > reports/"${OUTPUT_ARG}"
TASK_STATUS=$(echo $?)

saveTaskStatus "${TASK_STATUS}" "${ACTIVITY_SUB_TASK_CODE}"
