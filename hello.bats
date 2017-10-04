#!/usr/bin/env bats

@test "hello.sh greets hello" {
  run ./hello.sh
  [ "${output}" = "Hello, bats!!" ]
}
