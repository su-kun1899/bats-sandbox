#!/usr/bin/env bats

# load function file
load functions

# mocking command
touch(){
  echo "touch mocking"
}

@test "greet function show hello from script" {
  run greet "Hello from script!!"

  [ "${lines[0]}" = "Hello from script!!" ]
  [ "${lines[1]}" = "touch mocking" ]
}
