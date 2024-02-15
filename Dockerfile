FROM python:3.10-slim-buster
 
RUN apk add --no-cache --upgrade bash && \
    apt install python3-pip && \
    pip install pylint==3.0.3 && \
    apk add jq

WORKDIR /app

COPY build.sh .
ADD BP-BASE-SHELL-STEPS /app/buildpiper/shell-functions/

ENV ACTIVITY_SUB_TASK_CODE BP-TRIVY-TASK
ENV SLEEP_DURATION 5s
ENV VALIDATION_FAILURE_ACTION WARNING

ENV FORMAT_ARG "json"
ENV OUTPUT_ARG "pylint_scan.json"
ENTRYPOINT [ "./build.sh" ]
