#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WORKSPACE_DIR="${SCRIPT_DIR}/workspace"

command -v git >/dev/null 2>&1 || {
  echo "git is required." >&2
  exit 1
}

command -v uv >/dev/null 2>&1 || {
  echo "uv is required. Install it from https://docs.astral.sh/uv/getting-started/installation/" >&2
  exit 1
}

mkdir -p "${WORKSPACE_DIR}"

repos=(
  assignment1-basics
  assignment2-systems
  assignment3-scaling
  assignment4-data
  assignment5-alignment
)

for repo in "${repos[@]}"; do
  target="${WORKSPACE_DIR}/${repo}"
  url="https://github.com/stanford-cs336/${repo}.git"

  if [[ -d "${target}/.git" ]]; then
    echo "Updating ${repo}..."
    git -C "${target}" pull --ff-only
  elif [[ -e "${target}" ]]; then
    echo "${target} exists but is not a Git repository." >&2
    exit 1
  else
    echo "Cloning ${repo}..."
    git clone "${url}" "${target}"
  fi

  echo "Syncing ${repo} dependencies..."
  uv sync --directory "${target}"
done

echo "CS336 assignment workspaces are ready in ${WORKSPACE_DIR}."
