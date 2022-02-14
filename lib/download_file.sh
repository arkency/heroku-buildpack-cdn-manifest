#!/usr/bin/env bash

download_file () {
  local aws_binary_path=$1
  local remote_path=$2
  local asset_manifest_path=$(get_env_variable ${env_dir} "ASSET_MANIFEST_PATH")

  AWS_ACCESS_KEY_ID=$(get_env_variable ${env_dir} "AWS_ACCESS_KEY_ID") \
    AWS_SECRET_ACCESS_KEY=$(get_env_variable ${env_dir} "AWS_SECRET_ACCESS_KEY") \
    AWS_REGION=$(get_env_variable ${env_dir} "AWS_REGION") \
    $aws_binary_path s3 cp s3://$(get_env_variable ${env_dir} "AWS_BUCKET")/$remote_path $build_dir/$asset_manifest_path --quiet

  local status=$?

  if [[ status -eq 0 ]]; then
    echo "Downloaded remote $remote_path to $asset_manifest_path" | indent
  fi

  return $status
}
