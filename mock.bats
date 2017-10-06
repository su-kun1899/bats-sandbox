#!/usr/bin/env bats

# load function file
load functions

@test "curl mock returns 404 and handle_error stubbing" {
  # mock curl
  curl() {
    echo "404"
  }

  # stub handle_error function
  handle_error() {
    echo "handle_error function called!"
  }

  # 本当にcurlしてたら200
  run url_check "https://httpbin.org/status/200"

  # mockしているのでcurlは404
  [ "${lines[0]}" = "Response status: 404" ]
  # handle_errorはfileを作らない
  [ "${lines[1]}" = "handle_error function called!" ]
  [ "${status}" = 1 ]
}
