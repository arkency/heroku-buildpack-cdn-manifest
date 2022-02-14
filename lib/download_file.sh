#!/usr/bin/env bash

download_file () {
  local aws_binary_path=$1
  local remote_path=$2
  local local_path=$3

  AWS_ACCESS_KEY_ID=$(get_env_variable ${env_dir} "AWS_ACCESS_KEY_ID") \
    AWS_SECRET_ACCESS_KEY=$(get_env_variable ${env_dir} "AWS_SECRET_ACCESS_KEY") \
    AWS_REGION=$(get_env_variable ${env_dir} "AWS_REGION") \
    $aws_binary_path s3 cp s3://$(get_env_variable ${env_dir} "AWS_BUCKET")/$remote_path $local_path --quiet

  local status=$?

  if [[ status -eq 0 ]]; then
    echo "Downloaded remote $remote_path to $local_path"
  fi

  return $status
}
