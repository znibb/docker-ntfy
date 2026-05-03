#!/bin/bash
set -euo pipefail

if [ ! -f .env ]; then
  cp ./files/.env.example .env
fi

# 1. Check DATA_DIR is defined
source .env
if [ -z "${DATA_DIR:-}" ]; then
  echo "ERROR: DATA_DIR is not defined in .env"
  exit 1
fi

# 2. If DATA_DIR is in /etc/fstab, verify it is mounted
if grep -qs "${DATA_DIR}" /etc/fstab; then
  if ! mountpoint -q "${DATA_DIR}"; then
    echo "ERROR: ${DATA_DIR} is listed in /etc/fstab but not currently mounted"
    exit 1
  fi
fi

# 3. Create directories if missing
mkdir -p "${DATA_DIR}/lib"
mkdir -p "${DATA_DIR}/cache/attachments"

# 4. Touch database files if missing
touch -a "${DATA_DIR}/lib/auth.db"
touch -a "${DATA_DIR}/cache/cache.db"
