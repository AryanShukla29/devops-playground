#!/usr/bin/env bash
set -euo pipefail
echo "Starting local registry and Jenkins..."

if ! docker ps --format '{{.Names}}'|grep -q '^registry$';
then
 docker run -d -p 5000:5000 --restart=always --name
registry registry:2
else
 echo "registry already running"
fi

if ! docker ps --format '{{.Names}}'|grep -q '^jenkins$';
then
    docker run -d --name jenkins -p 8080:8080 -p 50000:50000\
    -v jenkins_data:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock jenkins/jenkins:lts

else 
  echo "jenkins already running"
fi

echo " Bootstrap done. Access Jenkins at http://localhost:8080 (forwarded port in Codespaces)."
