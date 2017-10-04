#!/usr/bin/env bats

@test "hello.sh greets hello" {
  run ./hello.bash
  [ "${output}" = "Hello, bats!!" ]
}
