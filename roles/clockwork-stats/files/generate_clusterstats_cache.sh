#!/bin/bash

# Script from Compute Canada, given by Tyler Collins to Guillaume Alain.
# Tweaked some lines laters.

TARGET_DIR="/home/mila-automation-local/slurm_report/mila"
SHOW_JOB_DEST="scontrol_show_job"
SHOW_NODE_DEST="scontrol_show_node"
SSHARE_DEST="sshare_plan"

if [[ ! -e "${TARGET_DIR}" ]]; then
    mkdir -p "${TARGET_DIR}"
fi

/opt/slurm/bin/scontrol show job  > "${TARGET_DIR}/${SHOW_JOB_DEST}.tmp" && \
  sync;sync && \
  mv "${TARGET_DIR}/${SHOW_JOB_DEST}.tmp" "${TARGET_DIR}/${SHOW_JOB_DEST}"
/opt/slurm/bin/scontrol show node > "${TARGET_DIR}/${SHOW_NODE_DEST}.tmp" && \
  sync;sync && \
  mv "${TARGET_DIR}/${SHOW_NODE_DEST}.tmp" "${TARGET_DIR}/${SHOW_NODE_DEST}"
/opt/slurm/bin/sshare -Plan       > "${TARGET_DIR}/${SSHARE_DEST}.tmp" && \
  sync;sync && \
  mv "${TARGET_DIR}/${SSHARE_DEST}.tmp" "${TARGET_DIR}/${SSHARE_DEST}"
