#!/usr/bin/env bats


# load function file
load http_request

# mock log method
log() {
  echo $1
}

# mock alert method
alert() {
  echo "alert method called!!"
}

@test "レスポンスが200の場合正常終了" {
  url="https://httpbin.org/status/200"
  run http_request ${url}

  [ "${lines[0]}" = "start" ]
  [ "${lines[1]}" = "http response status: 200" ]
  [ "${lines[2]}" = "end" ]
  [ "${status}" = 0 ]
}

@test "レスポンスが404の場合エラー" {
  url="https://httpbin.org/status/404"
  run http_request ${url}

  [ "${lines[0]}" = "start" ]
  [ "${lines[1]}" = "http response status: 404" ]
  [ "${lines[2]}" = "alert method called!!" ]
  [ "${lines[3]}" = "end" ]
  [ "${status}" = 1 ]
}

@test "レスポンスが504の場合エラー" {
  url="https://httpbin.org/status/504"
  run http_request ${url}

  [ "${lines[0]}" = "start" ]
  [ "${lines[1]}" = "http response status: 504" ]
  [ "${lines[2]}" = "alert method called!!" ]
  [ "${lines[3]}" = "end" ]
  [ "${status}" = 1 ]
}
