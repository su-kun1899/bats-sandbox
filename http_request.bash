#!/usr/bin/env bash

http_request() {
  local request_url=${1}

  log "start"

  http_code=$(curl -s -f -w '%{http_code}' -o /dev/null "${request_url}")
  log "http response status: ${http_code}"

  if [ ${http_code} -ne '200' ]; then
     # エラー時処理
     alert
     log "end"
     exit 1
  fi

  log "end"
}

log() {
  local msg=${1}
  echo ${msg}
}

alert() {
  echo "error happens." | mail -s "SOS!!" -r from@example.com to@example.com
}
