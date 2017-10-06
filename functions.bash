#!/usr/bin/env bash

function greet() {
  echo ${1}
  touch hoge.txt
}

function url_check(){
  local request_url=${1}
  readonly response_status=$(curl -s -f -w '%{http_code}' -o /dev/null "${request_url}")
  echo "Response status: ${response_status}"

  if [ ${response_status} -ne '200' ]; then
     # エラー時処理
     handle_error "Error!! Response status: ${response_status}"
     exit 1
  fi

  echo "Success!!"
}

function handle_error() {
  local msg=${1}
  # create log file
  echo ${msg} >> error.log
}
