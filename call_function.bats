#!/usr/bin/env bats

touch(){
  echo "touch"
}

load /Users/koji-sudo/Dev/bats-sandbox/call_function.sh

@test "greet function show hello from script" {
  run greet "aaa"
  [ "${lines[0]}" = "aaa" ]
  [ "${lines[1]}" = "touch" ]
}
