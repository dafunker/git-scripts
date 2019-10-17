#!/bin/sh

# Script to create and push git annotated tags for release. 

TAG=$1
MESSAGE="Release of ${TAG}"

if [ "${TAG}" = "" ]; then
  echo "[ERROR] No tag specified"
  exit 1
fi

echo "[INFO] Creating tag: ${TAG}"
git tag -a ${TAG} -m "${MESSAGE}"

if [ $? -eq 0 ]; then
  echo "[INFO] Pushing Tags..."
  git push origin --tags 

  if [ $? -eq 0 ]; then
    echo "[INFO] Commit Count:"
    git rev-list --count ${TAG}
  fi
fi

